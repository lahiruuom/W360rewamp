//
//  ServiceError.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-13.
//

import Foundation

enum ServiceError: Error {
    
    case responseError(Error)
    case parseError(Error)
    case badURL
    
    var description: String {
        switch self {
        case .responseError:
            return "response error"
        case .parseError(let error):
            return "parse error \(error)"
        default:
            return ""
        }
    }
}
