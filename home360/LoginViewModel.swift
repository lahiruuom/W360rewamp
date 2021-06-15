//
//  LoginViewModel.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
}
