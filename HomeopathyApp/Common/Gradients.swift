//
//  Gradients.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 10/06/23.
//

import Foundation
import SwiftUI

public struct Gradients {
    static let buttonDisable = LinearGradient(colors: [.gray],
                                              startPoint: .topLeading,
                                              endPoint: .bottomTrailing)
    
    static let buttonActive =  LinearGradient(colors: [.blue, .red],
                                              startPoint: .topLeading,
                                              endPoint: .bottomTrailing)
}
