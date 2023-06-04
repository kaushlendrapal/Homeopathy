//
//  IServiceProvider.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import Combine


protocol IServicePrivider {
    func execute<T: Decodable>(request: URLRequest) -> AnyPublisher<T, NetworkError>
    
    // image handling
//    func execute(request: URLRequest) -> AnyPublisher<URLResponse<UIImage>, Never>
}
