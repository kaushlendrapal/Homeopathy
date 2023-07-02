//
//  HPImageView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 02/07/23.
//

import Foundation
import SwiftUI
import Combine
import Kingfisher

enum ImageSource: String, Codable {
    case catalogue = "Catalogue"
    case system = "System"
    case remote = "Remote"
}

enum ImageState: String {
    case active = "active"
    case inactive = "inactive"
}

struct HPImageView: View {
    static let defaultImageUrl =  "https://prod-voot-images.s3.ap-south-1.amazonaws.com/v3Storage/subscription/tieredPlans/all_content_bg.png"
    var imageSource: ImageSource = .catalogue
    var inActiveImageUrl: String?
    var activeImageUrl: String?
    var placeholder: String = "default_icon"
    @State var state: ImageState
    
    init(imageSource: ImageSource = .catalogue,
         inActiveImageUrl: String? = nil,
         activeImageUrl: String? = nil,
         placeholder: String = "default_icon",
         state: ImageState = .active) {
        self.imageSource = imageSource
        self.inActiveImageUrl = inActiveImageUrl
        self.activeImageUrl = activeImageUrl
        self.placeholder = placeholder
        self.state = state
    }
    
    private var placeholderImage: Image {
        Image(self.placeholder)
            .resizable()
    }
    
    
    var body: some View {
        switch imageSource {
        case .catalogue:
            let imageName = state == .active ? self.activeImageUrl ?? "" : self.inActiveImageUrl ?? ""
            Image(imageName)
        case .system:
            let systemImageUrl = state == .active ? self.activeImageUrl ?? "" : self.inActiveImageUrl ?? ""
            Image(systemName: systemImageUrl)
        case .remote:
            let remoteUrl: URL = state == .active ?
            URL(string:self.activeImageUrl ?? Self.defaultImageUrl)! :
            URL(string: self.inActiveImageUrl ?? Self.defaultImageUrl)!
            KFImage(remoteUrl)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        HPImageView(imageSource: .system,
                    inActiveImageUrl: "house.fill",
                    activeImageUrl: "house.fill")
    }
}
