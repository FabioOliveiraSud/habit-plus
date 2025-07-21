//
//  SignUpViewModel.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 16/02/24.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var document = ""
    @Published var phone = ""
    @Published var birthday = ""
    @Published var gender = Gender.male
    @Published var action: Int? = 0
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    private var cancellableSignUp: AnyCancellable?
    private var cancellableSignIn: AnyCancellable?
    
    @Published var uiState: SignUpUIState = .none
    
    private let interactor: SignUpInteractor
    
    init(interactor: SignUpInteractor) {
        self.interactor = interactor
    }
    
    deinit {
        cancellableSignUp?.cancel()
        cancellableSignIn?.cancel()
    }
    
    func signUp() {
        self.uiState = .loading
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateFormatted = formatter.date(from: birthday)
        
        guard let dateFormatted = dateFormatted else {
            self.uiState = .error("Data inválida \(birthday)")
            return
        }
        
        formatter.dateFormat = "yyyy-MM-dd"
        let birthday = formatter.string(from: dateFormatted)
        
        let signUpRequest = SignUpRequest(name: name,
                                          email: email,
                                          document: document,
                                          phone: phone,
                                          gender: gender.index,
                                          birthday: birthday,
                                          password: password)
        
        cancellableSignUp = interactor.postUser(signUpRequest: signUpRequest)
            .receive(on: DispatchQueue.main)
             .sink { completion in
                switch(completion) {
                    case .failure(let appError):
                     self.uiState = .error(appError.message)
                     break
                    case .finished:
                     break
                }
            } receiveValue: { created in
                if (created) {
                    self.cancellableSignIn = self.interactor.login(signInRequest: SignInRequest(email: self.email, password: self.password))
                        .receive(on: DispatchQueue.main)
                        .sink { completion in
                            switch(completion) {
                            case .failure(let appError):
                                self.uiState = .error(appError.message)
                                break
                            case .finished:
                                break
                            }
                        } receiveValue: { success in
                            print(created)
                            
                            let auth = UserAuth(idToken: success.accessToken,
                                                refreshToken: success.refreshToken,
                                                expires: Date().timeIntervalSince1970 + Double(success.expires),
                                                tokenType: success.tokenType)
                            
                            self.interactor.insertAuth(userAuth: auth )
                            
                            self.publisher.send(created)
                            self.uiState = .success
                        }
            }
        }
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
