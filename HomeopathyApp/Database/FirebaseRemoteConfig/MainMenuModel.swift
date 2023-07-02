//
//  MainMenuModel.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 10/06/23.
//

import Foundation
import Combine


/// Firebase root key for menu navigation detail
///
class MainMenuConfig : Decodable, ObservableObject {
    
    init(apiVersion: String = "1.0.0",
                  bottomMenu: [MenuItem] = [],
                  profileMenu: [MenuItem] = []) {
        self.apiVersion = apiVersion
        self.bottomMenu = bottomMenu
        self.profileMenu = profileMenu
    }
    
    var apiVersion : String = "1.0.0"
    @Published var bottomMenu : [MenuItem] = []
    @Published var profileMenu : [MenuItem] = []

    enum CodingKeys: String, CodingKey {

        case apiVersion = "apiVersion"
        case bottomMenu = "bottomMenu"
        case profileMenu = "profileMenu"
    }

    required convenience init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let apiVersion = try values.decodeIfPresent(String.self, forKey: .apiVersion) ?? "1.0.0"
        let bottomMenu = try values.decodeIfPresent([MenuItem].self, forKey: .bottomMenu) ?? []
        let profileMenu = try values.decodeIfPresent([MenuItem].self, forKey: .profileMenu) ?? []
        self.init(apiVersion: apiVersion,
                  bottomMenu: bottomMenu,
                  profileMenu: profileMenu)
    }
    
    

}


/// Menu item is json mapping for each tab item or navigation list item in app.
/// Currently used for Profile and bottom tab bar

struct MenuItem: Codable, Identifiable {
    
    init(title: String = "",
         activeIconUrl: String? = nil,
         inactiveIconUrl: String? = nil,
         sourceApi: String? = nil, imageSource: ImageSource = .catalogue) {
        self.title = title
        self.activeIconUrl = activeIconUrl
        self.inactiveIconUrl = inactiveIconUrl
        self.sourceApi = sourceApi
        self.imageSource = imageSource
    }
    
    var id: String = UUID().uuidString
    var title : String
    var activeIconUrl : String?
    var inactiveIconUrl : String?
    var imageSource: ImageSource = .catalogue
    var sourceApi : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case activeIconUrl = "activeIconUrl"
        case inactiveIconUrl = "inactiveIconUrl"
        case sourceApi = "sourceApi"
        case imageSource = "imageSource"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        activeIconUrl = try values.decodeIfPresent(String.self, forKey: .activeIconUrl)
        inactiveIconUrl = try values.decodeIfPresent(String.self, forKey: .inactiveIconUrl)
        sourceApi = try values.decodeIfPresent(String.self, forKey: .sourceApi)
        imageSource = try values.decodeIfPresent(ImageSource.self, forKey: .imageSource) ?? ImageSource.catalogue
    }

}
