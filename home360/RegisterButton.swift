//
//  RegisterButton.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//
import Foundation
import SwiftUI

struct RegisterButton: View {
    
    var body: some View {
        Button("REGISTER") {
            
        }
        .buttonStyle(CustomButtonStyle(background: Color.appColor(.lightBrown), textSize: 17, fontName: .Bold))
    }
}

