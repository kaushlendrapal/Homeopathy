//
//  AppHeaderConfig.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 02/07/23.
//

import Foundation

class AppHeaderConfig: Codable, Identifiable {
    internal init(id: String = UUID().uuidString,
                  apiVersion: String? = nil,
                  appImage: MenuItem? = nil,
                  subscription: MenuItem? = nil,
                  name: String? = nil) {
        self.id = id
        self.apiVersion = apiVersion
        self.appImage = appImage
        self.subscription = subscription
        self.name = name
    }
    
        
    var id: String = UUID().uuidString
    var apiVersion : String?
    var appImage: MenuItem?
    var subscription: MenuItem?
    var profile: MenuItem?
    var name: String?


    
    private enum CodingKeys: String, CodingKey {
        case apiVersion = "apiVersion"
        case appImage = "appImage"
        case subscription = "subscription"
        case name = "name"
        case profile = "profile"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        apiVersion = try values.decodeIfPresent(String.self, forKey: .apiVersion) ?? ""
        appImage = try values.decodeIfPresent(MenuItem.self, forKey: .appImage)
        subscription = try values.decodeIfPresent(MenuItem.self, forKey: .subscription)
        profile = try values.decodeIfPresent(MenuItem.self, forKey: .profile)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
