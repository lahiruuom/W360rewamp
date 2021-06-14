//
//  home360App.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-13.
//

import SwiftUI

@main
struct home360App: App {
    
    var persistance: PersistanceProtocol? = Persistance()
    
    var body: some Scene {
        WindowGroup {
            if let  isSessionID = persistance?.isKeyChainExist(.keychain_access_token) {
                StartView(viewModel: StartViewModel(isSessionIDExist: isSessionID))
            }
        }
    }
}
