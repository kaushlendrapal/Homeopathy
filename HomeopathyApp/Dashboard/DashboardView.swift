//
//  DashboardView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 11/06/23.
//

import Foundation
import SwiftUI


struct DashboardView: View {
    var appStorage: AppStorage

    var body: some View {
        Text("Dashboard")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(appStorage: AppStorage(launchStep: .finish))
    }
}
