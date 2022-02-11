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
    var mockUserService: LoginMockService!
    
    override func setUp() {
        mockUserService = LoginMockService()
    }
    
    func testLoginWithCorrectDetailsSetsSuccessPresentedToTrue() {
        mockUserService.credential = Credential(
            loginType: "basic",
            email: "lahirumm92@gmail.com",
            password: "LahiruMM92@",
            thirdPartyToken: "")
        mockUserService.login()
        wait(for: [mockUserService.expectationTest], timeout: 10.0)
        XCTAssertTrue(mockUserService.isLogged)
    }
    
}
