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
    private static let cache = Cache<String, User>()
    var isSessionIDExist: Bool
    
    init(isSessionIDExist: Bool) {
        self.isSessionIDExist = isSessionIDExist
        self.isTabBarActive = isSessionIDExist
        IQKeyboardManager.shared.enable = true
        if let imageFromCache = StartViewModel.cache.value(forKey: "USER") {
            debugPrint(imageFromCache.surname)
        }
    }
}

