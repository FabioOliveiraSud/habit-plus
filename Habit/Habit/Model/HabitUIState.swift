//
//  HabitUIState.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 15/02/25.
//

import Foundation

enum HabitUIState: Equatable {
    case loading
    case emptyList
    case fullList([HabitCardViewModel])
    case error(String)
}
