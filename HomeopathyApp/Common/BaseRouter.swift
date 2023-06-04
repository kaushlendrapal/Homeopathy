//
//  BaseRouter.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 01/06/23.
//

import Foundation
import UIKit
import SwiftUI

protocol IRouter {
    var navigationController: UINavigationController { get set }
    func push()
    func pop()
    func popToRoot()
    func dismiss()
}


class BaseRouter: IRouter {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func push() {  }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func dismiss() {  }
    
    
}
