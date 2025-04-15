//
//  Date+Extension.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 15/04/25.
//

import Foundation


extension Date {
    
    func toString(desPattern dest: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = dest
        
        return formatter.string(from: self)
    }
}
