//
//  AppStorage.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 04/06/23.
//

import Foundation
import Combine

final class AppStorage : ObservableObject {
    static let shared = AppStorage(launchStep: .start)
    var launchStep: LaunchStep = .start
    @Published var mainMenuconfig: MainMenuConfig = MainMenuConfig()
    
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
        FirebaseRemoteStore.shared.fetchRemoteConfigValues(for: self)
    }
        
    private func onLibSetup() {
        self.launchStep = .appUpdate
        self.launchSetupForInitialAppLoading()
        print("onLibSetup")
    }
        
    private func checkForAppUpdate() {
        Task {
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
        if let _mainMenuconfig = FirebaseRemoteStore.shared.mainMenuConfig {
            self.mainMenuconfig =  _mainMenuconfig
        }
        print("Firebase fetch is done")
    }
}



enum LaunchStep {
    case start
    case libSetup
    case appUpdate
    case finish
}
