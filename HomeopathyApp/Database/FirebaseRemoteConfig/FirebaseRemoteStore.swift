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
        
    }
    
    var remoteConfigration: RemoteConfig!
    var mainMenuConfig: MainMenuConfig?
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
        let data = remoteConfig[RemoteConfigKeys.mainMenuConfig.rawValue].dataValue
        let decoder = JSONDecoder()
        self.mainMenuConfig = try? decoder.decode(MainMenuConfig.self, from: data)
        
    }
}
