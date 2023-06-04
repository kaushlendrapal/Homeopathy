//
//  SplashScreenRouter.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 01/06/23.
//

import Foundation
import UIKit
import SwiftUI

class SplashScreenRouter: BaseRouter {
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func push() {
        let view = SplashScreenView()
        let controller = HostingViewController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
}
