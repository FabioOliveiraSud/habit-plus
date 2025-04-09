//
//  HabitApp.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 25/01/24.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel(interactor: SplashInteractor()))
        }
    }
}
