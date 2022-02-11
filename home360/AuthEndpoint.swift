//
//  AuthEndpoint.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation

enum AuthEndpoint: RequestProtocol {
    case login(_ credential: Credential)
    case register(_ register: Register)
}

extension AuthEndpoint {
    
    var environment: Enviroment {
        NetworkManager.environment
    }
    
    var baseURL: ServiceEnviroment {
        return ServiceEnviroment(baseURL: environment.baseURL)
    }
    
    var endpoint: String {
        switch self {
        case .login:
            return "user/login"
        case .register:
            return "user/register"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .register:
            return .post
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .login(let credential):
            if credential.password == "" {
                return [
                    "login_type": credential.loginType,
                    "email": credential.email,
                    "provider_token": credential.thirdPartyToken,
                ]
            } else{
                return [
                    "login_type": credential.loginType,
                    "email": credential.email,
                    "password": credential.password,
                ]
            }
        case .register(let register):
            if register.loginType == "basic" {
                return [
                    "given_name": register.givenName,
                    "surname": register.surname,
                    "email": register.email,
                    "password": register.password,
                    "login_type": register.loginType
                ]
            } else {
                return [
                    "given_name": register.givenName,
                    "surname": register.surname,
                    "email": register.email,
                    "login_type": register.loginType,
                    "social_user_id": register.socialUserId,
                    "profile_image_url": register.profileImageUrl,
                    "provider_token": register.providerToken
                ]
            }
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .login, .register:
            return ["Content-Type": "application/json"]
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .login, .register:
            return.init()
        }
    }
}

