//
//  LoginUseCase.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import Combine

/// To get api call for user login api, equivalent to middleware
class LoginUseCase {
    
    var serviceProvider: ServiceProvider = ServiceProvider()
    
    func fetchUserLoginDetail(action: LoginAction) -> AnyPublisher<LoginAction, NetworkError> {
        return Empty().eraseToAnyPublisher()
    }
    
    func validateEmail(action: LoginAction, email: String) -> LoginAction {
        
        return .none
    }
}
