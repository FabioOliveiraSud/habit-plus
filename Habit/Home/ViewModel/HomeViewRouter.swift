//
//  HomeViewRouter.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 12/02/25.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    static func makeHabitView(viewModel: HabitViewModel) -> some View {
        return HabitView(viewModel: viewModel)
    }
    
    static func makeProfileView() -> some View {
        return ProfileView()
    }
}
