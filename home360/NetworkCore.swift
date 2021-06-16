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
    
    var baseURL: String
    
    init(baseURL: String = "") {
        self.baseURL = baseURL
    }
    
    func pathURL(endpont: String) -> String {
        return "\(baseURL)\(endpont)"
    }
}

