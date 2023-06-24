//
//  AppStorage.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 04/06/23.
//

import Foundation

final class AppStorage {
    var launchStep: LaunchStep = .start
    var mainMenuconfig: MainMenuConfig?
    
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
//        self.launchStep = .libSetup
//        self.launchSetupForInitialAppLoading()
        FirebaseRemoteStore.shared.fetchRemoteConfigValues(for: self)
    }
        
    private func onLibSetup() {
        self.launchStep = .appUpdate
        self.launchSetupForInitialAppLoading()
        print("onLibSetup")
    }
        
    private func checkForAppUpdate() {
        Task.detached {
            try await Task.sleep(nanoseconds: 1_000_000_000)
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

extension AppStorage: IFirebaseRemoteStore {
    
    func onRemoteConfigFetchCompleted() {
        self.launchStep = .libSetup
        self.launchSetupForInitialAppLoading()
        self.mainMenuconfig = FirebaseRemoteStore.shared.mainMenuConfig
        print("Firebase fetch is done")
    }
}



enum LaunchStep {
    case start
    case libSetup
    case appUpdate
    case finish
}
