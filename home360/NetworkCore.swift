//
//  NetworkCore.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-13.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case patch = "PATCH"
    case put = "PUT"
    case delete = "DELETE"
}

protocol RequestProtocol {
    var baseURL: ServiceEnviroment { get }
    var endpoint: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem] { get }
}

public struct ServiceEnviroment {
    
    var port: String
    var protocols: String
    var hosts: String
    var path: String
    
    init(port: String = "", protocols: String = "", hosts: String = "", path: String = "") {
        self.port = port
        self.protocols = protocols
        self.hosts = hosts
        self.path = path
    }
    
    func pathURL(endpont: String) -> String {
        return "\(protocols)\(port)\(hosts)\(path)\(endpont)"
    }
}

