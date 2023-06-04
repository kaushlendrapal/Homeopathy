//
//  UserStorage.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import Combine

final class UserStorage {
    
    var loginState: LoginState = LoginState()
    var loginAction: LoginAction = .none
    var loginReducer: LoginReducer = LoginReducer()
    var loginUseCase: LoginUseCase = LoginUseCase()
    private var disposableBag: Set<AnyCancellable> = []
    
    func dispatch(state: inout LoginState, action: LoginAction) {
        loginReducer.loginReducer(state: &state, action: action)
        
        // side effect
        dispatchLoginUseCaseProxy(state: &state, action: action)
    }
    
    // side effect on action will perform here
    func dispatchLoginUseCaseProxy(state: inout LoginState, action: LoginAction) {
        switch action {
        case .none: break
        case .fetching:
            if state.isFetching {
                loginUseCase.fetchUserLoginDetail(action: .fetching)
                    .sink(receiveCompletion: { _ in
                        print("done")
                    }, receiveValue: { action in
                        print(action)
                    })
                    .store(in: &disposableBag)
            }
        case .sucess: break
        default: break
        }
    }
    
}
