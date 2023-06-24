//
//  MenuItemView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 10/06/23.
//

import Foundation
import SwiftUI



struct MenuItemView: View {
    var menu: MenuItem
    @State var isSelected: Bool = false
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Image("home.circle")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isSelected ? Colors.Primary.color : Colors.Secondary.color)
                .aspectRatio(contentMode: .fit)
                .frame(width: DashboardUxGuide.tabBarWidth, height: DashboardUxGuide.tabBarHeight)
                .padding(.top, DashboardUxGuide.tabPadding)
            
            Text(menu.title!)
                .font(isSelected ? Fonts.semiBold(28.0).font : Fonts.regular(12.0).font)
                .foregroundColor(isSelected ? Colors.Primary.color : Colors.Secondary.color)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(menu: MenuItem(title: "Home", sourceApi: ""))
//        Text("Demo")
    }
}
