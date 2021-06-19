//
//  Register.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-19.
//

import Foundation

struct Register {
    var givenName: String,
        surname: String,
        email: String,
        password: String,
        loginType: String,
        socialUserId: String,
        profileImageUrl: String,
        providerToken: String
    
    init(givenName: String,
         surname: String,
         email: String,
         password: String,
         loginType: String,
         socialUserId: String,
         profileImageUrl: String,
         providerToken: String) {
        self.givenName = givenName
        self.surname = surname
        self.email = email
        self.password = password
        self.loginType = loginType
        self.socialUserId = socialUserId
        self.profileImageUrl = profileImageUrl
        self.providerToken = providerToken
    }
}
