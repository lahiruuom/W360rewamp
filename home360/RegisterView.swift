//
//  RegisterView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        ActivityIndicatorView(loadingState: viewModel.loadingState as! LoadingState) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ManualRegisterView(viewModel: viewModel)
                    SocialLoginView(titleLabel: "Or, Sign up with")
                        .padding(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .background(Color.white)
            .ignoresSafeArea()
            .onTapGesture {
                self.endEditing()
            }
            .alert(isPresented: self.$viewModel.isAlertPresented) {
                Alert(title: Text("SORRY!"), message: Text(self.viewModel.errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}
