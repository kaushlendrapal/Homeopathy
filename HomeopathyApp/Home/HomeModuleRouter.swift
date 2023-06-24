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
        var storage = AppStorage(launchStep: .start)
        let view = SplashScreenView(appStorage: storage)
        let controller = HostingViewController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func pushDashboardScreen() {
        var storage = AppStorage(launchStep: .start)
        let view = DashboardView(appStorage: storage)
        let controller = HostingViewController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
    
}
