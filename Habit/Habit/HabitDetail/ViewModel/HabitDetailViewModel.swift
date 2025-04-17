//
//  HabitDetailViewModel.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 17/04/25.
//

import Foundation
import SwiftUI

class HabitDetailViewModel: ObservableObject {
    
    @Published var uiState: HabitDetailUIState = .none
    @Published var value = ""
    
    let id: Int
    let name: String
    let label: String
    
    init(id: Int, name: String, label: String) {
        self.id = id
        self.name = name
        self.label = label
    }
}
