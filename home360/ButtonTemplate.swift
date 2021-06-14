//
//  ButtonWithImageTemplate.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct ButtonTemplate: ViewModifier {
    
    @State var background: Color = .blue
    @State var textColor: Color = .white
    @State var textSize: CGFloat = 16
    @State var fontName: Fonts = .Regular
    @State var cornerRadius: CGFloat = 7
    
    func body(content: Content) -> some View {
        return content
            .padding()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(background))
            .foregroundColor(.white)
            .font(Font.custom(fontName.rawValue, size: textSize))
    }
}

struct ButtonImage: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
        .imageScale(.medium)
        .cornerRadius(20)
    }
    
}
