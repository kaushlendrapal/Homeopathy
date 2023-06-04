//
//  SplashScreenView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        ZStack {
            Color.red
            VStack(alignment: .center) {
                Text("Splash Screen Loading 🦄")
                Button("Click Me for Login") {
                    print(" ===> Go to Login CTA done ")
                }
            }.padding()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)

    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
