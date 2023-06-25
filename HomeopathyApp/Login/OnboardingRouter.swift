//
//  OnboardingRouter.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 04/06/23.
//

import Foundation
import UIKit
import SwiftUI

class OnboardingRouter: BaseRouter {
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func push() {
        let userStorage = UserStorage(loginState: LoginState(),
                                      loginUseCase: LoginUseCase())
        let view = LoginView(userStorage: userStorage)
        
        let controller = HostingViewController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
}
