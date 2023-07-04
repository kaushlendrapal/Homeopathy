//
//  SceneHeaderView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 02/07/23.
//

import Foundation
import SwiftUI

struct SceneHeaderView: View {
    struct UXGuidelineConstant {
        static var topBarHeight: CGFloat = 85.0
        static var topBarPadding: CGFloat = 4.0
        static var topBarWidth: CGFloat = UIDevice.portraitWidth
    }
    var appHeaderConfig: AppHeaderConfig? = FirebaseRemoteStore.shared.appHeaderConfig
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 4) {
                if let appImage = appHeaderConfig?.appImage {
                    HPImageView(imageSource: appImage.imageSource,
                                inActiveImageUrl: appImage.inactiveIconUrl,
                                activeImageUrl: appImage.activeIconUrl,
                                state: .active)
                    .frame(width: 65, height: 65)
                    .aspectRatio(contentMode: .fit)
                    .padding(UXGuidelineConstant.topBarPadding)
                    .padding(.leading, 6)
                }
                Spacer()
                if let appTitle = appHeaderConfig?.name {
                    Text(appTitle)
                        .font(Fonts.bold(26.0).font)
                        .foregroundColor(Color.black)
                        .padding(UXGuidelineConstant.topBarPadding)
                }
                Spacer()
                if let profileImage = appHeaderConfig?.profile {
                    HPImageView(imageSource: profileImage.imageSource,
                                inActiveImageUrl: profileImage.inactiveIconUrl,
                                activeImageUrl: profileImage.activeIconUrl,
                                state: .active)
                    .frame(width: 34, height: 38)
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 10)
                }
            }
        }
        .frame(width: UXGuidelineConstant.topBarWidth, height: UXGuidelineConstant.topBarHeight)
        .background(Colors.background.color)
    }
    
}
