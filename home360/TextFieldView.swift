//
//  TextFieldView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextFieldCustom(placeholder: Text(placeholder), text: $text)
            .autocapitalization(.none)
    }
}
