//
//  AuthenticationManager.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 24/06/23.
//

import Foundation
import FirebaseAuth

class AuthenticationManager {
//    static let shared = AuthenticationManager()
    
    func signIn(with email: String, password: String) async throws -> AuthDataResult {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result
    }

    
//    func signIn(with email: String, password: String) {
//        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//            if error != nil {
//                print(error?.localizedDescription ?? "")
//            } else {
//                print("success")
//            }
//        }
//    }
    
    func signUp(with email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
                // new account created.
            }
        }
    }
    
    func signOut() {
        
    }
    
    
}
