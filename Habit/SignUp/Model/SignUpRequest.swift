//
//  SignUpRequest.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 02/03/24.
//

import Foundation

struct SignUpRequest: Encodable {
    
    let name: String
    let email: String
    let document: String
    let phone: String
    let gender: Int
    let birthday: String
    let password: String
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email
        case document
        case phone
        case gender
        case birthday
        case password
    }
}
