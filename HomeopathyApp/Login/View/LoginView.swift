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
                Text("Homeopathy Success")
                    .font(Fonts.regular(20).font)
                    .foregroundColor(Color.white)
                    .padding(.top, 60)
                    .padding(.bottom, 25)
                    .shadow(radius: 10.0, x: 20, y: 10)
                Image("homeopathy_clinic")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    TextField("Email", text: self.$email)
                        .foregroundColor(Colors.TextStyle.color)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                    
                    SecureField("Password", text: self.$password)
                        .foregroundColor(Colors.TextStyle.color)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                    
                }
                .padding([.leading, .trailing], 28.0)
                
                Button(action: {
                    // enable button press only if validation pass
                    self.userStorage.signIn(with: email, password: password)
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(Colors.Body.color)
                        .padding()
                        .frame(width: 146, height: 52)
                }
                .background(Color.white)
                .cornerRadius(50.0)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .padding(.top, 50)
                Spacer()
            }
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.68, green: 0.78, blue: 0.47), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.68, green: 0.78, blue: 0.47).opacity(0.31), location: 1.00),
                        Gradient.Stop(color: Color(red: 0.68, green: 0.78, blue: 0.47).opacity(0), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
            .edgesIgnoringSafeArea(.all)
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
