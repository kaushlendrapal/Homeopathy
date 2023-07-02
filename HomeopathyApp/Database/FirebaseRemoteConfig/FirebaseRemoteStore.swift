//
//  FirebaseRemoteStore.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 10/06/23.
//

import Foundation
import FirebaseCore
import FirebaseRemoteConfig

protocol IFirebaseRemoteStore: AnyObject {
    func onRemoteConfigFetchCompleted()
}


class FirebaseRemoteStore {
    static let shared = FirebaseRemoteStore()
    
    enum RemoteConfigKeys: String {
     case mainMenuConfig = "mainMenu"
     case appHeaderConfig = "appHeaderConfig"
    }
    
    var remoteConfigration: RemoteConfig!
    var mainMenuConfig: MainMenuConfig?
    var appHeaderConfig: AppHeaderConfig?
    weak var delegate: IFirebaseRemoteStore?
    
    private init() {
        remoteConfigration = RemoteConfig.remoteConfig()
    }

    func fetchRemoteConfigValues(for listener: IFirebaseRemoteStore? = nil) {
        guard let remoteConfig = remoteConfigration else { return }
        self.delegate = listener
        let cacheExpiration: TimeInterval = 30
        let remoteConfigSettings = RemoteConfigSettings()
        remoteConfigSettings.minimumFetchInterval = 30
        remoteConfig.fetch(withExpirationDuration: cacheExpiration) { (status, _) in
            if status == .success {
                guard let remoteConfig = self.remoteConfigration else { return }
                remoteConfig.activate { (status, error)  in
                    // notify done
                    self.setupRemoteConfig()
                    self.delegate?.onRemoteConfigFetchCompleted()
                }
            }
        }
    }

    
    private func setupRemoteConfig() {
        guard let remoteConfig = remoteConfigration else { return }
        // main menu tabs
        let data = remoteConfig[RemoteConfigKeys.mainMenuConfig.rawValue].dataValue
        self.mainMenuConfig = try? JSONDecoder().decode(MainMenuConfig.self, from: data)
        // App header config
        let appData = remoteConfig[RemoteConfigKeys.appHeaderConfig.rawValue].dataValue
        self.appHeaderConfig = try? JSONDecoder().decode(AppHeaderConfig.self, from: appData)
        
    }
}
