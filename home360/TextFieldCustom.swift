//
//  TextFieldTemplate.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-15.
//

import SwiftUI

struct TextFieldCustom: View {
    
    var placeholder: Text
    var placeholderColor: Color = .black
    var placeholderFont: Fonts = .Regular
    var placeholderSize: CGFloat = 17
    @Binding var text: String
    var editingChanged: (Bool) -> Void = { _ in }
    var commit: () -> Void = { }
    
    var body: some View {
        ZStack {
            Color.clear
            VStack(alignment: .leading) {
                VStack{
                    placeholder
                        .font(Font.custom(placeholderFont.rawValue, size: placeholderSize))
                        .foregroundColor(placeholderColor)
                }
                VStack(alignment: .leading){
                    TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                        .background(Color.white)
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                .frame(height: 40)
                .background(RoundedRectangle(cornerRadius: 5)
                                .fill(Color.white)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2))
            }
        }
    }
}
