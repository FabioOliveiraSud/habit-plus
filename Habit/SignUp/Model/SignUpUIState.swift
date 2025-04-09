//
//  SignUpUIState.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 16/02/24.
//

import Foundation

enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
