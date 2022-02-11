//
//  SocialLoginView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct SocialLoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var registerViewModel: RegisterViewModel
    var titleLabel: String
    var isRegister: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Text(titleLabel)
                    .font(Font.custom(Fonts.Medium.rawValue, size: 24))
                    .padding(EdgeInsets(top: 20, leading: 5, bottom: 34, trailing: 5))
                FacebookButton(viewModel: viewModel, registerViewModel: registerViewModel, isRegister: isRegister)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 29, trailing: 31))
                GoogleLoginView(viewModel: viewModel, registerViewModel: registerViewModel, isRegister: isRegister)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 29, trailing: 31))
                SignInWithApple()
                    .onTapGesture {
                        if isRegister {
                            registerViewModel.attemptAppleSignIn()
                        } else{
                            viewModel.attemptAppleSignIn()
                        }
                    }
                    .frame(height: 56)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 31, trailing: 31))
            }
        }
    }
}
