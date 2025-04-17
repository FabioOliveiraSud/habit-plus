//
//  HabitCardViewRouter.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 17/04/25.
//

import Foundation
import SwiftUI

enum HabitCardViewRouter {
    
    static func makeHabitDetailView(id: Int, name: String, label: String) -> some View {
        let viewModel = HabitDetailViewModel(id: id, name: name, label: label)
        return HabitDetailView(viewModel: viewModel)
    }
}


