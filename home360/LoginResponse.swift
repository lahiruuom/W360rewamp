//
//  LoginResponse.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Decodable {
    let message: String
    let error: Bool
    let payload: Login
}

// MARK: - Payload
struct Login: Decodable {
    let user: User?
    let accessToken, refreshToken: String?

    enum CodingKeys: String, CodingKey {
        case user
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}

