//
//  UIColor+Extensions.swift
//  H360 iOS App
//
//  Created by Lahiru Munasinghe on 2020-12-22.
//
import SwiftUI

enum AssetsColor: String {
    case sliderBGColor
    case menuSelectableColor
    case lightGray
    case lightBrown
    case gray
    case red
    case facebook
}

enum GradientColor: String {
    case orangeWhite
}


extension Color {
    
    static func appColor(_ name: AssetsColor) -> Color {
        return Color(name.rawValue)
    }
    
    static func gradientColor(_ gradient: GradientColor) -> [Color] {
        switch gradient {
        case .orangeWhite:
            let color1 = Color(UIColor(red: 0.90, green: 0.33, blue: 0.04, alpha: 1))
            let color2 = Color(UIColor(red: 1.00, green: 0.56, blue: 0.33, alpha: 1))
            return [color1, color2]
        }
        
    }
}
