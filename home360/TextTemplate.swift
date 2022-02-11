//
//  TextTemplate.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//
import SwiftUI

struct TextTemplate: ViewModifier {
    
    @State var textColor: Color = .white
    @State var textSize: CGFloat = 17
    @State var fontName: Fonts = .Regular
    
    func body(content: Content) -> some View {
        return content
            .foregroundColor(textColor)
            .font(Font.custom(fontName.rawValue, size: textSize))
    }
}

