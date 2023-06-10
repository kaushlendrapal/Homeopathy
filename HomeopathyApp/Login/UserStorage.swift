//
//  UserStorage.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import Combine

final class UserStorage: ObservableObject {
    @Published var loginState: LoginState
    var loginAction: LoginAction = .none
    var loginReducer: LoginReducer
    var loginUseCase: LoginUseCase
    private var disposableBag: Set<AnyCancellable> = []
    
    init(loginState: LoginState,
         loginAction: LoginAction = .none,
         loginReducer: LoginReducer,
         loginUseCase: LoginUseCase) {
        self.loginState = loginState
        self.loginAction = loginAction
        self.loginReducer = loginReducer
        self.loginUseCase = loginUseCase
    }
    
    func resetUserStateOnAppear() {
        self.loginAction = .none
        
    }
    
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
