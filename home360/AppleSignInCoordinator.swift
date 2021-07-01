//
//  AppleSignInCoordinator.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-07-01.
//

import AuthenticationServices

// Used in login view model
class AppleSignInCoordinator: NSObject, ASAuthorizationControllerDelegate {
    // Backend Service Variable
    var loginViewModel: LoginViewModel
    var registerViewModel: RegisterViewModel
    var isRegister: Bool = false
    
    init(loginVM: LoginViewModel, registerMV: RegisterViewModel, isRegister: Bool = false) {
        self.loginViewModel = loginVM
        self.registerViewModel = registerMV
        self.isRegister = isRegister
    }
    
    // Shows Sign in with Apple UI
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    // Delegate methods
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential =  authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let idToken = credential.identityToken else { return }
            let thirdPartyToken = String(decoding: idToken, as: UTF8.self)
            if isRegister {
                registerViewModel.socialUserId = credential.user
                let fullName = credential.fullName
                registerViewModel.givenName = fullName?.givenName ?? ""
                registerViewModel.surname = fullName?.familyName ?? ""
                registerViewModel.email = credential.email ?? ""
                registerViewModel.loginType = "Google"
                registerViewModel.providerToken = thirdPartyToken
                registerViewModel.register()
            } else {
                loginViewModel.username = credential.email ?? ""
                loginViewModel.loginType = "apple"
                loginViewModel.thirdPartyToken = thirdPartyToken
                loginViewModel.login()
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}
