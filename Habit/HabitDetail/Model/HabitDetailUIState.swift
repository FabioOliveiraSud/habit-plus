//
//  HabitDetailUIState.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 17/04/25.
//

import Foundation


enum HabitDetailUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
