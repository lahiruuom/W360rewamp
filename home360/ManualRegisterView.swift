//
//  ManualRegisterView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-18.
//

import SwiftUI

struct ManualRegisterView: View {
    
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.appColor(.lightGray)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                VStack(alignment: .leading)  {
                    Text("Create your Home360 Account!")
                        .modifier(TextTemplate(textColor: .black, textSize: 24, fontName: .Bold))
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    HStack {
                        Text("Already a member?")
                            .modifier(TextTemplate(textColor: .gray, textSize: 18, fontName: .Regular))
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                        Button("Login"){
                            
                        }
                        .foregroundColor(.black)
                        .font(Font.custom(Fonts.Medium.rawValue, size: 18))
                        Text("Here")
                            .modifier(TextTemplate(textColor: .gray, textSize: 18, fontName: .Regular))
                    }
                }
                .padding(EdgeInsets(top: 74, leading: 16, bottom: 0, trailing: 0))
                TextFieldView(placeholder: "Given Name", text: $viewModel.givenName)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                TextFieldView(placeholder: "Surname", text: $viewModel.surname)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                TextFieldView(placeholder: "Email ID", text: $viewModel.email)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                TextFieldView(placeholder: "Password", text: $viewModel.password, isSecureField: true)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                TextFieldView(placeholder: "Confirm Password", text: $viewModel.confirmPassword, isSecureField: true)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
                RegisterButton(viewModel: viewModel)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 16, trailing: 31))
            }
        }
    }
}
