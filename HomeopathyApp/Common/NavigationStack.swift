//
//  NavigationStack.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 04/06/23.
//

import Foundation
import UIKit

/* This class is used to manage Navigation stack
 *
 */

final class NavigationStack {
    
    static func getKeyWindow() -> UIWindow? {
        guard let keyWindow = (UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.delegate as? SceneDelegate)?
            .window else { return nil }
        
        return keyWindow
    }
    
    static func getRootNavigationController() -> UINavigationController? {
        guard let sceneDelegate = (UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.delegate as? SceneDelegate)
        else { return nil }
        
        return sceneDelegate.homeModuleRouter.navigationController
    }
    
    
    
}
