//
//  HomeViewRouter.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 12/02/25.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    static func makeHabitView() -> some View {
        let viewModel = HabitViewModel()
        return HabitView(viewModel: viewModel)
    }
}
