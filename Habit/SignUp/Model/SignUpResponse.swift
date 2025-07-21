//
//  SignUpResponse.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 28/03/24.
//

import Foundation

struct SignUpResponse: Decodable {
    
    let accessToken: String
    let refreshToken: String
    let expires: Int
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expires
        case tokenType = "token_type"
    }
}
