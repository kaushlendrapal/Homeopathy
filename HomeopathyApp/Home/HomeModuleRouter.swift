//
//  HomeModuleRouter.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 01/06/23.
//

import Foundation
import UIKit
import SwiftUI


class HomeModuleRouter: BaseRouter {
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func push() {
        let coordinator = SplashScreenRouter(navigationController: navigationController)
        coordinator.push()
    }
}
