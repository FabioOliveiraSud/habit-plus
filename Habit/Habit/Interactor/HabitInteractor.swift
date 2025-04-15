//
//  HabitInteractor.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 15/04/25.
//

import Foundation
import Combine

class HabitInteractor {
    
    private let remote: HabitRemoteDataSource = .shared
    
}

extension HabitInteractor {
    
    func fetchHabits() -> Future<[HabitResponse], AppError> {
        return remote.fetchHabits()
    }
}


