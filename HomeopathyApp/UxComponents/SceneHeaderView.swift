//
//  SceneHeaderView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 02/07/23.
//

import Foundation
import SwiftUI

struct SceneHeaderView: View {
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 4) {
                HPImageView(imageSource: .catalogue,
                            inActiveImageUrl: "",
                            activeImageUrl: "",
                            state: .active)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: DashboardUxGuide.tabBarWidth, height: DashboardUxGuide.tabBarHeight)
                    .padding(.top, DashboardUxGuide.tabPadding)
            }
        }
    }
    
}
