//
//  SignInView.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 09/02/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var action: Int? = 0
    @State var navigationHidden = true
    
    var body: some View {
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationView {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20){
                            Spacer(minLength: 100)
                            VStack(alignment: .center, spacing: 16) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                                
                                Text("Login")
                                    .foregroundColor(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)
                                
                                emailField
                                passwordField
                                enterButton
                                registerLink
                                
                                Text ("Copyright - Fabio V&M LTDA 2023")
                                    .foregroundColor(Color.gray)
                                    .font(Font.system(size: 13).bold())
                                    .padding(.top, 230)
                            }
                        }
                        
                        if case SignInUIState.error(let value) = viewModel.uiState {
                            Text("")
                                .alert(isPresented: .constant(true)) {
                                    Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("OK")) {
                                        
                                    })
                                }
                        }
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 32)
                        .navigationTitle("Login")
                        .navigationBarTitleDisplayMode(.automatic)
                        .navigationBarHidden(navigationHidden)
                }
                .onAppear {
                    self.navigationHidden = true
                }
                .onDisappear {
                    self.navigationHidden = false
                }

            }
        }
    }
}

extension SignInView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "e-mail inválido",
                     failure: !viewModel.email.isEmail())
    }
}

extension SignInView {
    var passwordField: some View {
        EditTextView (text: $viewModel.password,
                      placeholder: "Senha",
                      keyboard: .emailAddress,
                      error: "A senha deve ter ao menos 8 caracteres",
                      failure: viewModel.password.count < 8,
                      isSecure: true)
    }
}

extension SignInView {
    var enterButton: some View {
        LoadingButtonView(action: {
            viewModel.login()
        }, text: "Entrar", 
           showProgress: self.viewModel.uiState == SignInUIState.loading,
           disable: !viewModel.email.isEmail() || viewModel.password.count < 8)
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Ainda não possui uma conta?")
                .foregroundColor(.gray)
                .padding(.top, 48)
            ZStack {
                NavigationLink(destination: viewModel.signUpView(),
                               tag: 1,
                               selection: $action,
                               label: { EmptyView() })
                
                Button("Realize seu Cadastro") {
                    self.action = 1
                }
            }
        }
    }
}

struct SignInView_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            let viewModel = SignInViewModel(interactor: SignInInteractor())
            SignInView(viewModel: viewModel)
                .preferredColorScheme($0)
        }
    }
}
