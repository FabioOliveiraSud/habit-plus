//
//  ProfileView.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 21/07/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State var fullName = ""
    @State var email = "geektop10oficial@gmail.com"
    @State var cpf = "436.584.728-71"
    @State var phone = " (11) 91034-0853"
    @State var birthday = "04/12/1995"
    @State var selectedGender: Gender? = .male
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    
                    Section(header: Text("Dados cadastrais")) {
                        HStack {
                            Text("Nome")
                            Spacer()
                            TextField("Digite o nome", text: $fullName)
                                .keyboardType(.alphabet)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack {
                            Text("E-mail")
                            Spacer()
                            TextField("", text: $email)
                                .disabled(true)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack {
                            Text("CPF")
                            Spacer()
                            TextField("", text: $cpf)
                                .disabled(true)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack {
                            Text("Celular")
                            Spacer()
                            TextField("Digite o seu celular", text: $phone)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack {
                            Text("Nascimento")
                            Spacer()
                            TextField("Digite a data de nascimento", text: $birthday)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        NavigationLink {
                            GenderSelectorView(selectedGender: $selectedGender, genders: Gender.allCases, title: "Escolha o gênero")
                        } label: {
                            Text(selectedGender?.rawValue ?? "")
                        }

                    }
                    
                }
            }
            .navigationBarTitle(Text("Editar Perfil"), displayMode:
                .automatic)
        }
    }
}

#Preview {
    ProfileView()
}
