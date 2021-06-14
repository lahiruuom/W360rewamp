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
                    .font(Font.custom(Fonts.Bold.rawValue, size: 17))
            }
            .modifier(ButtonTemplate(background: Color.appColor(.facebook)))
            .frame(height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct FacebookButton_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButton()
    }
}

