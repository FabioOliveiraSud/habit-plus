//
//  HabitDetailRemoteDataSource.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 27/05/25.
//

import Foundation
import Combine

class HabitDetailRemoteDataSource {
    
    static var shared: HabitDetailRemoteDataSource = HabitDetailRemoteDataSource()
    private init() {
        
    }
    
    func save(habitId: Int, request: HabitValueRequest) -> Future<Bool, AppError> {
        return Future<Bool, AppError> { promise in
            let path = String(format: WebService.Endpoint.habitsValues.rawValue, habitId)
            
            WebService.call(path: path, method: .post, body: request) { result in
              switch result {
                case .failure(_, let data):
                  if let data = data {
                      let decoder = JSONDecoder()
                      let response = try? decoder.decode(SignInErrorResponse.self, from: data)
                        promise(.failure(AppError.response(message: response?.detail.message ?? "Erro desconhecido no servidor")))
                
                  }
                  break
                case .success(_):
                  
                  promise(.success(true))
                  
                  break
              }
            }

        }
    }
    
}

