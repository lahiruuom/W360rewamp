//
//  ManualLoginView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI
import Foundation

struct ManualLoginView: View {
    
    @Binding var username: String
    @Binding var password: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.appColor(.lightGray)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    VStack {
                        Text("Welcome Back to Home360!")
                            .modifier(TextTemplate(textColor: .black, textSize: 24, fontName: .Bold))
                            .lineLimit(.none)
                    }
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                    HStack {
                        Text("New member?")
                            .modifier(TextTemplate(textColor: .gray, textSize: 18, fontName: .Regular))
                        Button(action: {
                            
                        }, label: {
                            Text("Register")
                                .underline()
                                .modifier(TextTemplate(textColor: .black, textSize: 18, fontName: .Regular))
                        })
                        Text("here")
                            .modifier(TextTemplate(textColor: .gray, textSize: 18, fontName: .Regular))
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 16))
                TextFieldView(placeholder: "Email ID", text: $username)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                TextFieldView(placeholder: "Password", text: $password)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                LoginButton()
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
            }
        }
        .ignoresSafeArea()
    }
}
