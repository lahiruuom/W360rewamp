//
//  AuthEndpoint.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation

enum AuthEndpoint: RequestProtocol {
    case login(_ credential: Credential)
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
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
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
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .login:
            return.init()
        }
    }
}

