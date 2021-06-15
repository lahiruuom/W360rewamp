//
//  AppleLoginView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-15.
//

import SwiftUI
import AuthenticationServices

final class SignInWithApple: UIViewRepresentable {
    
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    return ASAuthorizationAppleIDButton()
  }
  
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    
  }
}
