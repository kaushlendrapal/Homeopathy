//
//  ServiceProvider.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import Combine

class ServiceProvider: IServicePrivider {
    
    func execute<T>(request: URLRequest) -> AnyPublisher<T, NetworkError> where T : Decodable {
        return Empty()
            .eraseToAnyPublisher()
    }
}
