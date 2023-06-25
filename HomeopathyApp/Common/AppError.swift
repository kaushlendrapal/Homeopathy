//
//  AppError.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation


enum AppError: Error {

}


enum ValidationError: Error {
    case InvalidEmailPassword
    
    var title: String {
        switch self {
        case .InvalidEmailPassword: return "User Validation Error"
        default: return "Validation Error"
        }
    }
    
    var desc: String {
        switch self {
        case .InvalidEmailPassword: return "Invalid User email or Password, Please check with Support team for password reset"
        default: return "Validation Error"
        }
    }
}


enum NetworkError: Error {
    
}
