//
//  ErrorResponse.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 28/03/24.
//

import Foundation

struct ErrorResponse: Decodable {
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case detail
    }
}
