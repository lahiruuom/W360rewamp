//
//  LoginView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ManualLoginView(viewModel: viewModel)
                SocialLoginView(titleLabel: "Or, login with")
                    .padding(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .background(Color.white)
        .ignoresSafeArea()
        .onTapGesture {
            self.endEditing()
        }
    }
}
