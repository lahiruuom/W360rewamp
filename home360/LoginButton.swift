//
//  LoginButton.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct LoginButton: View {
    var body: some View {
        Button("LOGIN") {
            print("button pressed")
        }
        .modifier(ButtonTemplate(background: Color.appColor(.lightBrown), textSize: 17, fontName: .Bold))
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}
