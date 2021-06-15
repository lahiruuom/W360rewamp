//
//  GoogleLoginView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct GoogleLoginView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("button pressed")
            }) {
                Image(Images.LoginView.google.rawValue)
                    .resizable()
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Continue with Google")
                    .modifier(TextTemplate(textColor: .black, textSize: 17, fontName: .Medium))
            }
            .modifier(ButtonTemplate(background: .white))
            .frame(width: .infinity, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct GoogleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLoginView()
    }
}
