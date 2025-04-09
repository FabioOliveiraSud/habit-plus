//
//  SignUpViewRouter.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 16/02/24.
//

import SwiftUI

enum SignUpViewRouter {
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
