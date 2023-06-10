//
//  AppStorage.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 04/06/23.
//

import Foundation

final class AppStorage {
    var launchStep: LaunchStep = .start
    init(launchStep: LaunchStep) {
        self.launchStep = launchStep
    }
    
    func launchSetupForInitialAppLoading() {
        switch launchStep {
        case .start:
            onfinishLaunching()
        case .libSetup:
            onLibSetup()
        case .appUpdate:
            checkForAppUpdate()
        case .finish:
            dispatch(action: .goToLoginScreen)
        }
    }
    
    private func onfinishLaunching() {
        Task.detached {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            self.launchStep = .libSetup
            self.launchSetupForInitialAppLoading()
            print("onfinishLaunching")
        }
    }
        
    private func onLibSetup() {
        Task.detached {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            self.launchStep = .appUpdate
            self.launchSetupForInitialAppLoading()
            print("onLibSetup")
        }
    }
        
    private func checkForAppUpdate() {
        Task.detached {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            self.launchStep = .finish
            self.launchSetupForInitialAppLoading()
            print("checkForAppUpdate")
        }
    }
        
    private func dispatch(action: AppAction) {
        DispatchQueue.main.async {
            if action == .goToLoginScreen {
                // perform login navigation
                let rootNC = NavigationStack.getRootNavigationController()!
                let onboardingRouter = OnboardingRouter(navigationController: rootNC)
                onboardingRouter.push()
            }
        }
    }

}



enum LaunchStep {
    case start
    case libSetup
    case appUpdate
    case finish
}
