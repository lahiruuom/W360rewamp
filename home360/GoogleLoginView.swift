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
                    .frame(width: 37, height: 37, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Continue with Google")
                    .font(Font.custom(Fonts.Bold.rawValue, size: 17))
                    .foregroundColor(.black)
            }
            .modifier(ButtonTemplate(background: .white))
            .frame(height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct GoogleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLoginView()
    }
}
