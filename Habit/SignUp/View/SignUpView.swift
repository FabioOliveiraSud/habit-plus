//
//  SignUpView.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 15/02/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center ){
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Cadastro")
                            .foregroundColor(Color("textColor"))
                            .font((Font.system(.title).bold()))
                            .padding(.bottom, 5)
                        
                        fullNameField
                        emailField
                        passwordField
                        documentField
                        phoneField
                        birthdayField
                        genderField
                        saveButton
                    }
                    Spacer()
                }.padding(.horizontal, 8)
            }.padding()
            
            if case SignUpUIState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("OK")) {
                            
                        })
                    }
            }
        }
    }
}

extension SignUpView {
    var fullNameField: some View {
        EditTextView(text: $viewModel.name,
                     placeholder: "Nome Completo *",
                     keyboard: .alphabet,
                     error: "e-mail inválido",
                     failure: viewModel.name.count < 3)
    }
}

extension SignUpView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail *",
                     keyboard: .emailAddress,
                     error: "e-mail inválido",
                     failure: !viewModel.email.isEmail())
    }
}

extension SignUpView {
    var passwordField: some View {
        EditTextView (text: $viewModel.password,
                      placeholder: "Senha *",
                      keyboard: .emailAddress,
                      error: "A senha deve ter ao menos 8 caracteres",
                      failure: viewModel.password.count < 8,
                      isSecure: true)
    }
}

extension SignUpView {
    var documentField: some View {
        EditTextView(text: $viewModel.document,
                     placeholder: "CPF *",
                     keyboard: .numberPad,
                     error: "  inválido",
                     failure: viewModel.document.count != 11)
    }
}

extension SignUpView {
    var phoneField: some View {
        EditTextView(text: $viewModel.phone,
                     placeholder: "Celular *",
                     keyboard: .numberPad,
                     error: "Entre com o DDD + 8 ou 9 dígitos",
                     failure: viewModel.phone.count < 10 || viewModel.phone.count >= 12)
    }
}
    extension SignUpView {
        var birthdayField: some View {
            EditTextView(text: $viewModel.birthday,
                         placeholder: "Data de nascimento *",
                         keyboard: .numberPad,
                         error: "Data deve ser dd/MM/yyyy ",
                         failure: viewModel.birthday.count != 10)
        }
    }
    
    extension SignUpView {
        var genderField: some View {
            Picker("Gender", selection: $viewModel.gender) {
                ForEach(Gender.allCases, id: \.self) { value in
                    Text(value.rawValue)
                        .tag(value)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.top, 16)
                .padding(.bottom, 40)
        }
    }
    
    extension SignUpView {
        var saveButton: some View {
            LoadingButtonView(action: {
                viewModel.signUp()
            }, 
               text: "Cadastrar",
               showProgress: self.viewModel.uiState == SignUpUIState.loading,
                        disable: !viewModel.email.isEmail() ||
                        viewModel.password.count < 8 ||
                        viewModel.name.count < 3 ||
                        viewModel.document.count != 11 ||
                        viewModel.phone.count < 10 || viewModel.phone.count >= 12 ||
                        viewModel.birthday.count != 10)
        }
    }


struct SignUpView_Previewa: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            let viewModel = SignUpViewModel(interactor: SignUpInteractor())
            SignUpView(viewModel: viewModel)
                .preferredColorScheme($0)
        }
    }
}
