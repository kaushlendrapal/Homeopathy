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
    var loginUseCase: LoginUseCase
    @Published var shouldShow: Bool = false

    // will move alert to common place accessible to all mini storage
    @Published var alertModel: AlertModel = AlertModel()
    private var disposableBag: Set<AnyCancellable> = []
    var authManager: AuthenticationManager = AuthenticationManager()
    
    init(loginState: LoginState,
         loginAction: LoginAction = .none,
         loginUseCase: LoginUseCase) {
        self.loginState = loginState
        self.loginAction = loginAction
        self.loginUseCase = loginUseCase
    }
    
    func resetUserStateOnAppear() {
        self.loginAction = .none
        
    }
    
    func signIn(with email: String, password: String) {
        Task {
            do {
                var _ = try await authManager.signIn(with: email, password: password)
                await MainActor.run(body: {
                    self.routeToDashboardScreen()
                })
            } catch {
                await MainActor.run(body: {
                    // show alert user name or password is invalid
                    print(error)
                    self.showValidationAlertOnFailure()
                })
            }
        }
    }
    
    func showValidationAlertOnFailure() {
        // invalid login error
        self.alertModel.title = ValidationError.InvalidEmailPassword.title
        self.alertModel.desc = ValidationError.InvalidEmailPassword.desc
        self.shouldShow = true
    }
    
    func routeToDashboardScreen() {
        let homeModuleRouter: HomeModuleRouter? = NavigationStack.getHomeModuleRouter()
        homeModuleRouter?.pushDashboardScreen()
    }
    
    func dispatch(state: LoginState, action: LoginAction) {
        
        // side effect with updated state
        dispatchLoginUseCaseProxy(state: state, action: action)
    }
    
    // side effect on action will perform here
    func dispatchLoginUseCaseProxy(state: LoginState, action: LoginAction) {
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


// user reducer function
extension UserStorage {
    
}
