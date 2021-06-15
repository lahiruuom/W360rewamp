//
//  StartView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct StartView: View {
    
    @ObservedObject var viewModel: StartViewModel
    
    var body: some View {
        Image(Images.StartView.StartIcon.rawValue)
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .scaledToFit()
    }
}

struct StartView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
