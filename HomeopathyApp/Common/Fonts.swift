//
//  Fonts.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 10/06/23.
//

import Foundation
import SwiftUI

public enum Fonts {
    private static var fontFamily = "SF Pro Rounded"
    // spacial text
    case thin(CGFloat)
    case extraLight(CGFloat)
    case light(CGFloat)
    // body text, button
    case regular(CGFloat)
    // page heading
    case medium(CGFloat)
    case semiBold(CGFloat)
    // Heading, menu
    case bold(CGFloat)
    // navigation bar title
    case extraBold(CGFloat)
    case black(CGFloat)
    case extraBlack(CGFloat)
    
    private var styleName: String {
        switch self {
            case .thin: return "Thin"
            case .extraLight: return "ExtraLight"
            case .light: return "Light"
            case .regular: return "Regular"
            case .medium: return "Medium"
            case .semiBold: return "SemiBold"
            case .bold: return "Bold"
            case .extraBold: return "ExtraBold"
            case .black: return "Black"
            case .extraBlack: return "ExtraBlack"
        }
    }
    
    public var uiFont: UIFont {
        switch self {
            case let .thin(size),
                 let .extraLight(size),
                 let .light(size),
                 let .regular(size),
                 let .medium(size),
                 let .semiBold(size),
                 let .bold(size),
                 let .extraBold(size),
                 let .black(size),
                 let .extraBlack(size):
                    return UIFont(name: Self.fontFamily, size: size) ?? UIFont()
        }
    }
    
    public var font: Font {
        switch self {
            case let .thin(size),
                 let .extraLight(size),
                 let .light(size),
                 let .regular(size),
                 let .medium(size),
                 let .semiBold(size),
                 let .bold(size),
                 let .extraBold(size),
                 let .black(size),
                 let .extraBlack(size):
                    let fontFamilyName = Self.fontFamily + "-" + styleName
                    return Font.custom(fontFamilyName, size: size)
        }
    }
}
