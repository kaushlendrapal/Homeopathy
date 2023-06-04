//
//  LoginReducer.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation

struct LoginState {
    var loginModel: LoginModel = LoginModel()
    var isFetching: Bool = true
    var error: String?
}

enum LoginAction {
    case none
    case deepLink
    case autoTrigger
    case fetching
    case sucess
    case fail(error: NetworkError)
    
}

class LoginReducer {
    
    func loginReducer(state: inout LoginState, action: LoginAction) {
        switch action {
        case .none: break
        case .deepLink: break
        case .autoTrigger: break
        case .fetching: break
        case .sucess: break
        }
    }
}
