//
//  home360App.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-13.
//

import SwiftUI
import FacebookLogin
import GoogleSignIn

@main
struct home360App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var persistance: PersistanceProtocol? = Persistance()
    
    var body: some Scene {
        WindowGroup {
            if let  isSessionID = persistance?.isKeyChainExist(.keychain_access_token) {
                StartView(viewModel: StartViewModel(isSessionIDExist: isSessionID))
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Facebook Signin
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Google Signin
        GIDSignIn.sharedInstance().clientID = Config.SOCIAL_LOGIN.GOOGLE.CLIENT_ID
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(app, open: url, options: options)
        return true
    }
}
