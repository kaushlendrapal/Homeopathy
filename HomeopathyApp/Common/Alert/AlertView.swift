//
//  AlertView.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 25/06/23.
//

import Foundation
import SwiftUI
import Combine


struct AppAlertView: View {
    @ObservedObject var alertModel: AlertModel
    let onOkeyAction: (() -> Void)
    
    var body: some View {
            switch alertModel.alertType {
            case .informative:
                validationFailAlertView
            case .binary:
                validationFailAlertView
            case .destractive:
                validationFailAlertView
            }
    }
    
    
    // MARK: - Undo Alert View
    private var validationFailAlertView: some View {
        VStack {
            HStack {
                Spacer()
                Text(alertModel.title)
                    .font(Fonts.bold(22).font)
                    .foregroundColor(Color.white)
                    .padding([.top, .bottom], 16)
                Spacer()
            }
            .background(Color.red)
            
            HStack {
                Text(alertModel.desc)
                    .font(Fonts.medium(18).font)
                    .foregroundColor(Color.black)
                    .padding([.all], 16)
            }
            HStack {
                Button {
                    onOkeyAction()
                } label: {
                    Text("Okey")
                        .font(Fonts.bold(20).font)
                        .foregroundColor(Color.black)
                        .padding([.top, .bottom], 8)
                        .padding([.leading, .trailing], 16)
                }
                .buttonStyle(.plain)
                .background(
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    )
                    .stroke(.pink, lineWidth: 2)
                )
                .padding([.bottom, .top], 8)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10.0, x: 20, y: 10)
        .padding([.leading, .trailing], 12)

    }
}

struct AppAlertView_Previews: PreviewProvider {
    static var previews: some View {
        var alertInfo = AlertModel(alertType: .informative, title: ValidationError.InvalidEmailPassword.title,
                                   desc: ValidationError.InvalidEmailPassword.desc, shouldShow: true)
        AppAlertView(alertModel: alertInfo, onOkeyAction: {
            print("okey button cta")
        })
    }
}


