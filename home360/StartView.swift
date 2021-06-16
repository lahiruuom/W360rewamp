//
//  StartView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel: StartViewModel
    
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                LoginView(viewModel: LoginViewModel())
            } else {
                Image(Images.StartView.StartIcon.rawValue)
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .scaledToFit()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
