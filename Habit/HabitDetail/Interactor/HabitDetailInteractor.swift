//
//  HabitDetailInteractor.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 27/05/25.
//

import Foundation
import Combine

class HabitDetailInteractor {
    
    private let remote: HabitDetailRemoteDataSource = .shared
    
}

extension HabitDetailInteractor {
    
    func save(habitId: Int, habitValueRequest request: HabitValueRequest) -> Future<Bool, AppError> {
        return remote.save(habitId: habitId, request: request)
    }
}
