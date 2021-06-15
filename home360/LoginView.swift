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
                ManualLoginView(username: $viewModel.username, password: $viewModel.password)
                SocialLoginView()
            }
        }
        .background(Color.appColor(.lightGray))
    }
}
