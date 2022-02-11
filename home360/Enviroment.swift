//
//  Enviroment.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-13.
//
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
