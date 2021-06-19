//
//  StartViewModel.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//
import SwiftUI
import IQKeyboardManagerSwift

class StartViewModel: ObservableObject {
    
    @Published var isTabBarActive: Bool = false
    
    var isSessionIDExist: Bool
    
    init(isSessionIDExist: Bool) {
        self.isSessionIDExist = isSessionIDExist
        self.isTabBarActive = isSessionIDExist
        IQKeyboardManager.shared.enable = true
    }
}

