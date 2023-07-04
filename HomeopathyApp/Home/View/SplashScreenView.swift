//
//  SplashScreenView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    var appStorage: AppStorage
    
    var body: some View {
        ZStack {
            Color.gray
            VStack(alignment: .center) {
                Image("homeopathy_launch")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .overlay (
                VStack(alignment: .center) {
                    VStack {
                        Text("Homeopathy")
                        Text("Success")
                    }
                    .foregroundColor(Color.white)
                    .font(Fonts.extraBold(20).font)
                    .padding(10)
                    .background(Colors.background.color)
                    .cornerRadius(10)
                    .padding([.top], 100)
                    .padding([.trailing], 35)
                    Spacer()
                }
            )
        }.onAppear {
            appStorage.launchSetupForInitialAppLoading()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)

    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(appStorage: AppStorage(launchStep: .start))
    }
}
