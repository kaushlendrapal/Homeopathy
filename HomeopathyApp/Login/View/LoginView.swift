//
//  LoginView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 03/06/23.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userStorage: UserStorage
    var body: some View {
        Text("Login View")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
