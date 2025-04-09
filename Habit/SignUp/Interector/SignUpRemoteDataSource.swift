//
//  SignUpRemoteDataSource.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 16/07/24.
//

import Foundation
import Combine

class SignUpRemoteDataSource {
    
    // Padrão singleton
    // Temos apenas 1 unico objeto vivo dentro da aplicação
    
    static var shared: SignUpRemoteDataSource = SignUpRemoteDataSource()
    private init() {
        
    }
    
    func postUser(request: SignUpRequest) -> Future<Bool, AppError> {
        return Future { promise in
            WebService.call(path: .postUser, body: request) { result in
              switch result {
                case .failure(let error, let data):
                  if let data = data {
                    if error == .badRequest {
                      let decoder = JSONDecoder()
                      let response = try? decoder.decode(ErrorResponse.self, from: data)
                        promise(.failure(AppError.response(message: response?.detail ?? "Erro interno no Servidor")))
                      //completion(nil, response)
                    }
                  }
                  break
                case .success(_):
                  promise(.success(true))
                  //completion(true, nil)
                  break
              }
            }
        }
    }
}

