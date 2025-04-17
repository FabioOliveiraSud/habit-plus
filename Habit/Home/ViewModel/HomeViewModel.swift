//
//  HomeViewModel.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 15/02/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    let viewModel = HabitViewModel(interactor: HabitInteractor())
}

extension HomeViewModel {
    func habitView() -> some View {
        return HomeViewRouter.makeHabitView(viewModel: viewModel)
    }
}
