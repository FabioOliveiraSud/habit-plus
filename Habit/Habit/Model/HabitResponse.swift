//
//  HabitResponse.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 15/04/25.
//

import Foundation

struct HabitResponse: Decodable {
    
    let id: Int
    let name: String
    let label: String
    let iconUrl: String?
    let value: Int?
    let lastDate: String?
    
    
    enum CondingKeys: String, CodingKey {
        case id
        case name
        case label
        case iconUrl = "icon_url"
        case value
        case lastDate = "last_date"
    }
    
}
