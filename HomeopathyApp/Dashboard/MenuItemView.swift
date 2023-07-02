//
//  MenuItemView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 10/06/23.
//

import Foundation
import SwiftUI



struct MenuItemView: View {
    
    struct UXGuidelineConstant {
        static var tabBarSpacing: CGFloat  = 0.0
        static var tabBarWidth: CGFloat {
            return UIDevice.portraitWidth / 5
        }
        static var tabBarHeight: CGFloat = 44.0
        static var tabbarWidthOffset: CGFloat = 4.0
        
        static func tabPadding(_ padding: CGFloat) -> CGFloat {
            return 8.0
        }
        static func tabWidth(_ tabs: Int) -> CGFloat {
            return UIDevice.portraitWidth
        }
    }
    
    var menu: MenuItem
    @State var isSelected: Bool = false
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            HPImageView(imageSource: menu.imageSource,
                        inActiveImageUrl: menu.inactiveIconUrl,
                        activeImageUrl: menu.activeIconUrl,
                        state: .active)
                .aspectRatio(contentMode: .fit)
                .frame(width: DashboardUxGuide.tabBarWidth, height: DashboardUxGuide.tabBarHeight)
                .padding(.top, DashboardUxGuide.tabPadding)
            
            Text(menu.title)
                .font(isSelected ? Fonts.semiBold(16.0).font : Fonts.regular(12.0).font)
                .foregroundColor(isSelected ? Color.red : Color.black)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(menu: MenuItem(title: "Home",
                                    activeIconUrl: "house.fill", inactiveIconUrl: "house.fill", sourceApi:"", imageSource: .system))
    }
}


struct BottomMenuStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration
            .label
            .background(
                Capsule().fill(Color.white).scaleEffect(configuration.isPressed ? 4 : 0).opacity(configuration.isPressed ? 0.8 : 0.0).cornerRadius(10)
            )
            .animation(.easeOut(duration: 1), value: configuration.isPressed)
    }
}
