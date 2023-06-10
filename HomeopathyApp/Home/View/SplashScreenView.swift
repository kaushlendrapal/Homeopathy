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
                    Text("Homeopathy")
                        .foregroundColor(Color.white)
                        .font(Fonts.extraBold(35).font)
                        .padding(10)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 50,
                                            leading: 0,
                                            bottom: 0,
                                            trailing: 35))

                    Spacer()
                }
            )
            .padding()
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
