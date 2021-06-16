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
    @State var cornerRadius: CGFloat = 5
    
    func body(content: Content) -> some View {
        return content
            .padding()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(background)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2))
            .foregroundColor(.white)
            .font(Font.custom(fontName.rawValue, size: textSize))
    }
}

struct CustomButtonStyle: ButtonStyle {
    
    @State var background: Color = .blue
    @State var textColor: Color = .white
    @State var textSize: CGFloat = 16
    @State var fontName: Fonts = .Regular
    @State var cornerRadius: CGFloat = 5
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom(fontName.rawValue, size: textSize))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .contentShape(Rectangle())
            .background(RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(background)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2))
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
            .listRowBackground(configuration.isPressed ? Color.blue.opacity(0.5) : background)
    }
}

struct ButtonImage: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .imageScale(.medium)
            .cornerRadius(20)
    }
    
}
