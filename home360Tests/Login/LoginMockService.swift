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
    var isLogged: Bool = false
    var credential: Credential!
    let expectationTest = XCTestExpectation(description: "Loging API")
    
    init(manager: LoginRemoteDataManagerProtocol = LoginRemoteDataManager(),
         persistance: PersistanceProtocol = Persistance()) {
        self.manager = manager
        self.persistance = persistance
    }
    
    func login() {
        let responsePublisher = manager?.login(credential)
            .print()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { response in
                self.isLogged = !response.error
                self.expectationTest.fulfill()
            }
        cancellables += [responsePublisher]
    }
    
    func facebookLogin() {
        
    }
    
    func googleSignIn() {
        
    }
    
    func attemptAppleSignIn() {
        
    }
}
