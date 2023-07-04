//
//  Colors.swift
//  HomeopathyApp
//
//  Created by Kaushlendra Pal on 10/06/23.
//

import Foundation
import SwiftUI

public enum Colors {
    // background layers
    case background // top level ui background
    case Surface //main screen background
    case SecondarySurface
    // overlay for Alert, sheet, presentation, popup
    case overlay
    // Opacity: inactive, hidden, disable
    case Blur
    case Body // label text color
    case TextStyle  //input text color
    case Primary // top navigation
    case Secondary // heading
    // used for special case like t&c, eula
    case custom(String)
    case white
    case Black
    case clear
    case Premium
    
    private var rawValue: String {
        switch self {
        case .background:
            return "Background"
        case .Surface:
            return "PrimarySurface"
        case .SecondarySurface:
            return "SecondarySurface"
            
        case .Secondary:
            return "Secondary"
        case .TextStyle:
            return "TextStyle"
        case .Body:
            return "Body"
        case .Primary:
            return "Primary"
            
        case .overlay:
            return "overlay"
        case .Blur:
            return "Blur"
            
        case .white:
            return "White"
        case .Black:
            return "Black"
        case .clear:
            return "Clear"
        case .Premium:
            return "Premium"
        case let .custom(string):
            return string
        }
    }
    
    var color: Color {
        switch self {
        case .clear:
            return Color.clear
        case let .custom(string):
            return Color(hex: string)
        default:
            return Color(self.rawValue)
        }
    }
    
    var uiColor: UIColor? {
        if #available(iOS 14.0, *) {
            return UIColor(color)
        } else {
            switch self {
            case .clear:
                return UIColor.clear
            default:
                return UIColor(named: self.rawValue)
            }
        }
    }
}


public extension Color {
    
    init(hex: String) {
        var string: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
