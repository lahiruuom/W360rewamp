//
//  Enviroment.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-13.
//

import Foundation

//enum Enviroment {
//    case dev
//    case prod
//}

//extension Enviroment {
//
//    var env: ServiceEnviroment {
//        switch self {
//        case .dev:
//            return ServiceEnviroment(protocols: "https://", hosts: "develop-dot-home360-backend-api.et.r.appspot.com", path: "/api/v1")
//        case .prod:
//            return ServiceEnviroment(protocols: "https://", hosts: "home360-backend-api.et.r.appspot.com", path: "/api/v1")
//        }
//    }
//
//    func baseURL(endpoint: String) -> String {
//        return self.env.pathURL(endpont: endpoint)
//    }
//
//}

import Foundation

enum Enviroment {
    
    case dev
    case prod
    
    var baseURL: String {
        switch NetworkManager.environment {
        case .dev:
            return Config.API.DEV.HOST
        case .prod:
            return Config.API.LIVE.HOST
        }
    }
    
    var version: String {
        switch NetworkManager.environment {
        case .dev:
            return Config.API.DEV.CLIENT_VERSION
        case .prod:
            return Config.API.LIVE.CLIENT_VERSION
        }
    }

    var client: String {
        switch NetworkManager.environment {
        case .dev:
            return Config.API.DEV.CLIENT
        case .prod:
            return Config.API.LIVE.CLIENT
        }
    }
}

struct NetworkManager {
    static let environment: Enviroment = .prod
}
