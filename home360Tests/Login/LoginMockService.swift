//
//  LoginMockService.swift
//  home360Tests
//
//  Created by Lahiru Manulanka Munasinghe on 2021-07-16.
//

import Foundation
import XCTest
@testable import home360
import Combine

class LoginMockService: LoginViewModelProtocol {
    private var cancellables: [AnyCancellable?] = []
    
    var manager: LoginRemoteDataManagerProtocol?
    var persistance: PersistanceProtocol?
    
    var credential: Credential!
    
    init(manager: LoginRemoteDataManagerProtocol = LoginRemoteDataManager(),
         persistance: PersistanceProtocol = Persistance()) {
        self.manager = manager
        self.persistance = persistance
    }
    
    func login() {
        
    }
    
    func facebookLogin() {
        
    }
    
    func googleSignIn() {
        
    }
    
    func attemptAppleSignIn() {
        
    }
}
