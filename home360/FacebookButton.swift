//
//  FacebookButton.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct FacebookButton: View {
    var body: some View {
        HStack {
            Button(action: {
                print("button pressed")
            }) {
                Image(Images.LoginView.facebook.rawValue)
                Text("Continue with Facebook")
                    .modifier(TextTemplate(textColor: .white, textSize: 17, fontName: .Medium))
            }
            .modifier(ButtonTemplate(background: Color.appColor(.facebook)))
            .frame(height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct FacebookButton_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButton()
    }
}

