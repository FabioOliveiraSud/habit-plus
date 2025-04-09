//
//  AppError.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 08/04/24.
//

import Foundation

enum AppError: Error {
    case response(message: String)
    
    public var message: String {
        switch self {
        case .response(let message):
            return message
        }
    }
}
