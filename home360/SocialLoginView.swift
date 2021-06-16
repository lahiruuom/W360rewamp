//
//  SocialLoginView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct SocialLoginView: View {
    
    var titleLabel: String
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Text(titleLabel)
                    .font(Font.custom(Fonts.Medium.rawValue, size: 24))
                    .padding(EdgeInsets(top: 20, leading: 5, bottom: 34, trailing: 5))
                FacebookButton()
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 29, trailing: 31))
                GoogleLoginView()
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 29, trailing: 31))
                SignInWithApple()
                    .frame(height: 56)
                    .padding(EdgeInsets(top: 0, leading: 31, bottom: 31, trailing: 31))
            }
        }
    }
}
