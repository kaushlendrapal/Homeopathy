//
//  LoginView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var userStorage: UserStorage
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {
            VStack {
                Text("Homeopathy App")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                    .shadow(radius: 10.0, x: 20, y: 10)
                Image("homeopathy_clinic")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Colors.themeTextField)
                        .cornerRadius(20)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Colors.themeTextField)
                        .cornerRadius(20)
                    
                }
                .padding([.leading, .trailing], 28.0)
                
                Button(action: {
                    // enable button press only if validation pass
                    self.userStorage.signIn(with: email, password: password)
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                }
                .background(
                    LinearGradient(colors: [Color.purple, .blue, .purple],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .cornerRadius(15.0)
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding(.top, 50)
                Spacer()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
            if userStorage.shouldShow {
                AppAlertView(alertModel: self.userStorage.alertModel,
                             onOkeyAction: {
                    self.userStorage.shouldShow.toggle()
                    userStorage.alertModel.shouldShow = false
                })
                .isHidden(!userStorage.shouldShow)
            }
        }
        .onAppear {
            // perform load action
            userStorage.resetUserStateOnAppear()
                
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let userStorage = UserStorage(loginState: LoginState(),
                                      loginUseCase: LoginUseCase())
        LoginView(userStorage: userStorage)
    }
}
