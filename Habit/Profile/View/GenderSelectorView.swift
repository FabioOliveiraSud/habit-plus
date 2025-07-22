//
//  GenderSelectorView.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 22/07/25.
//

import SwiftUI

struct GenderSelectorView: View {
    
    @Binding var selectedGender: Gender?
    
    let genders: [Gender]
    let title: String
    
    var body: some View {
        Form {
            Section(header: Text(title)) {
                List(genders, id: \.id) { item in
                    
                    HStack {
                        Text(item.rawValue)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(selectedGender == item ? .orange : .white)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if !(selectedGender == item) {
                            selectedGender = item
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        
    }
}

#Preview {
    GenderSelectorView(selectedGender: .constant(.male), genders: Gender.allCases, title: "Teste")
}
