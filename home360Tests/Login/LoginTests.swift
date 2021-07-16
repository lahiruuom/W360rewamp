//
//  LoginTests.swift
//  home360Tests
//
//  Created by Lahiru Manulanka Munasinghe on 2021-07-02.
//

import XCTest
@testable import home360
import Combine

class LoginTests: XCTestCase {
    private var cancellables: [AnyCancellable?] = []
    var viewModel: LoginViewModel!
    var mockUserService: LoginMockService!
    
    override func setUp() {
        viewModel = LoginViewModel()
        mockUserService = LoginMockService()
    }
    
    func testLoginWithCorrectDetailsSetsSuccessPresentedToTrue() {
        var loginResponse: LoginResponse?
        var isLogged = false
        
        let promise = expectation(description: "Loging API")
        let credential = Credential(
            loginType: "basic",
            email: "lahirumm92@gmail.com",
            password: "LahiruMM92@",
            thirdPartyToken: "")
        let responsePublisher = mockUserService.manager?.login(credential)
            .print()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [] completion in
                switch completion {
                case .failure:
                    isLogged = false
                case .finished:
                    isLogged = true
                }
            }, receiveValue: { response in
                loginResponse = response.payload
                isLogged = true
                promise.fulfill()
            })
        cancellables += [responsePublisher]
        
        wait(for: [promise], timeout: 10.0)
        
        XCTAssertNotNil(loginResponse)
        XCTAssertTrue(isLogged)
    }
    
}
