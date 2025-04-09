//
//  CustomTextFieldStyle.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 19/02/24.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 12)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.orange, lineWidth: 0.8)
            )
    }
}
