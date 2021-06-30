//
//  FacebookButton.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct FacebookButton: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var registerViewModel: RegisterViewModel
    var isRegister: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                if isRegister {
                    registerViewModel.facebookRegister()
                } else{
                    viewModel.facebookLogin()
                }
            }) {
                Image(Images.LoginView.facebook.rawValue)
                Text("Continue with Facebook")
                    .modifier(TextTemplate(textColor: .white, textSize: 17, fontName: .Medium))
            }
            .modifier(ButtonTemplate(background: Color.appColor(.facebook)))
        }
    }
}

