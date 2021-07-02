//
//  ManualLoginView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI
import Foundation

struct ManualLoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State var isLinkActive = false
    
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
                        NavigationLink(
                            destination: RegisterView(viewModel: RegisterViewModel(), loginViewModel: viewModel)
                                .navigationBarTitle("")
                                .navigationBarHidden(true),
                            isActive: $isLinkActive) {
                            Button(action: {
                                isLinkActive = true
                            }, label: {
                                Text("Register")
                                    .underline()
                                    .modifier(TextTemplate(textColor: .black, textSize: 18, fontName: .Regular))
                            })
                        }
                        Text("here")
                            .modifier(TextTemplate(textColor: .gray, textSize: 18, fontName: .Regular))
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 16))
                TextFieldView(placeholder: "Email ID", text: $viewModel.username)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                TextFieldView(placeholder: "Password", text: $viewModel.password)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                LoginButton(viewModel: viewModel)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
            }
        }
        .ignoresSafeArea()
    }
}
