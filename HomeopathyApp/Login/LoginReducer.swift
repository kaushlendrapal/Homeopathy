//
//  LoginReducer.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import Combine

class LoginState: ObservableObject {
    @Published var userEmail: String = ""
    @Published var password: String = ""
    var isFetching: Bool = true
    var error: String?
}

enum LoginAction {
    case none
    case passworkLoginCTA
    case mobileloginCTA
    case fetching
    case sucess
    case fail(error: NetworkError)
}

