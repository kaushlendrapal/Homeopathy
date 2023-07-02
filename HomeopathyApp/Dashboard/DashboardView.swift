//
//  DashboardView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 11/06/23.
//

import Foundation
import SwiftUI
import Combine

struct DashboardView: View {
    @ObservedObject var appStorage: AppStorage

    var body: some View {
        ZStack(alignment: .topLeading) {
            
            VStack(spacing: 0.0) {
                //            showHeaderView()
                bottomMenuView
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    
    private var bottomMenuView: some View {
        VStack {
            HStack(spacing: 0) {
                Spacer()
                ForEach(appStorage.mainMenuconfig.bottomMenu.indices, id: \.self) { index in
                    Button {
                        print("action ")
                    } label: {
                        MenuItemView(menu: appStorage.mainMenuconfig.bottomMenu[index],
                                     isSelected: Bool.random())
                    }
                    .buttonStyle(BottomMenuStyle())
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 44.0)
        }
    }
    
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(appStorage: AppStorage.shared)
    }
}
