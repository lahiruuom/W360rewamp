//
//  LoginButton.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct LoginButton: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        Button("LOGIN") {
            viewModel.credential = Credential(loginType: "basic", email:  viewModel.username, password: viewModel.password, thirdPartyToken: "")
            viewModel.login()
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .frame(height: 48, alignment: .center)
        .buttonStyle(CustomButtonStyle(background: Color.appColor(.lightBrown), textSize: 17, fontName: .Bold))
    }
}
