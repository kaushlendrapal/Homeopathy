//
//  MainMenuModel.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 10/06/23.
//

import Foundation

import Foundation


/// Firebase root key for menu navigation detail
///
struct MainMenuConfig : Codable {
    let apiVersion : String?
    let bottomMenu : [MenuItem]?
    let profileMenu : [MenuItem]?

    enum CodingKeys: String, CodingKey {

        case apiVersion = "apiVersion"
        case bottomMenu = "bottomMenu"
        case profileMenu = "profileMenu"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        apiVersion = try values.decodeIfPresent(String.self, forKey: .apiVersion)
        bottomMenu = try values.decodeIfPresent([MenuItem].self, forKey: .bottomMenu)
        profileMenu = try values.decodeIfPresent([MenuItem].self, forKey: .profileMenu)
    }

}


/// Menu item is json mapping for each tab item or navigation list item in app.
/// Currently used for Profile and bottom tab bar

struct MenuItem: Codable {
    
    init(title: String? = nil,
         activeIconUrl: String? = nil,
         inactiveIconUrl: String? = nil,
         sourceApi: String? = nil) {
        self.title = title
        self.activeIconUrl = activeIconUrl
        self.inactiveIconUrl = inactiveIconUrl
        self.sourceApi = sourceApi
    }
    
    let title : String?
    let activeIconUrl : String?
    let inactiveIconUrl : String?
    let sourceApi : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case activeIconUrl = "activeIconUrl"
        case inactiveIconUrl = "inactiveIconUrl"
        case sourceApi = "sourceApi"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        activeIconUrl = try values.decodeIfPresent(String.self, forKey: .activeIconUrl)
        inactiveIconUrl = try values.decodeIfPresent(String.self, forKey: .inactiveIconUrl)
        sourceApi = try values.decodeIfPresent(String.self, forKey: .sourceApi)
    }

}
