//
//  AlertModel.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 25/06/23.
//

import Foundation
import Combine

class AlertModel: ObservableObject {
    @Published var alertType: AlertType = .informative
    @Published var title: String = "Homeopathy"
    @Published var desc: String = ""
    @Published var shouldShow: Bool = false
    
    enum AlertType {
        case informative
        case binary
        case destractive
    }
    
    init(alertType: AlertType = .informative,
         title: String = "",
         desc: String = "",
         shouldShow: Bool = false) {
        self.alertType = alertType
        self.title = title
        self.desc = desc
        self.shouldShow = shouldShow
    }
    
}
