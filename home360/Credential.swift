//
//  Credential.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation

struct Credential {
    var loginType: String
    var email: String
    var password: String
    var thirdPartyToken: String
    
    init(loginType: String, email: String, password: String, thirdPartyToken: String) {
        self.loginType = loginType
        self.email = email
        self.password = password
        self.thirdPartyToken = thirdPartyToken
    }
}
