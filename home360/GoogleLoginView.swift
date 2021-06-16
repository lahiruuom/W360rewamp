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
                    .frame(width: 20, height: 20, alignment: .center)
                Text("Continue with Google")
                    .modifier(TextTemplate(textColor: .black, textSize: 17, fontName: .Medium))
            }
            .modifier(ButtonTemplate(background: .white))
            .frame(height: 44, alignment: .center)
        }
    }
}

struct GoogleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLoginView()
    }
}
