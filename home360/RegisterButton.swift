//
//  RegisterButton.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//
import Foundation
import SwiftUI

struct RegisterButton: View {
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        Button("REGISTER") {
            viewModel.validatePasswordAndRegister()
        }
        .buttonStyle(CustomButtonStyle(background: Color.appColor(.lightBrown), textSize: 17, fontName: .Bold))
        .frame(height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
