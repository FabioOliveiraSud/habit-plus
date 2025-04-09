//
//  RefreshRequest.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 12/08/24.
//

import Foundation

struct RefreshRequest: Encodable {
    
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "refresh_token"
        
    }
}
