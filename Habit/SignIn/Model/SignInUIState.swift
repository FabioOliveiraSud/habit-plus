//
//  SignInUIState.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 14/02/24.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
