//
//  GoogleLoginView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct GoogleLoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var registerViewModel: RegisterViewModel
    var isRegister: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                if isRegister {
                    registerViewModel.setupGoogleSignIn()
                    registerViewModel.googleSignIn()
                } else {
                    viewModel.setupGoogleSignIn()
                    viewModel.googleSignIn()
                }
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
