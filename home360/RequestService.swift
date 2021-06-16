import Combine
import Foundation

protocol RequestServiceProtocol {
    var enviroment: Enviroment { get }
    
    func fetchData<T: Decodable>(request: RequestProtocol) -> AnyPublisher<T, Error>
    func getURLRequest(urlString: String, _ request: RequestProtocol) -> URLRequest?
    func configRequestMethods(request: RequestProtocol, urlRequest: inout URLRequest)
    func urlSessionRequest<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error>
}

struct RequestService: RequestServiceProtocol {
    internal let enviroment: Enviroment
    
    init(enviroment: Enviroment = Enviroment.dev ) {
        self.enviroment = enviroment
    }
    
    func fetchData<T: Decodable>(request: RequestProtocol) -> AnyPublisher<T, Error> {
        print(T.self)
        let urlString = request.baseURL.pathURL(endpont: request.endpoint)
        guard var urlRequest = getURLRequest(urlString: urlString, request) else { preconditionFailure("can't create url") }
        configRequestMethods(request: request, urlRequest: &urlRequest)
        return urlSessionRequest(urlRequest: urlRequest)
    }
    
    internal func getURLRequest(urlString: String, _ request: RequestProtocol) -> URLRequest? {
        guard let url = URL(string: urlString), var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        if request.queryItems.count > 0 { urlComponent.queryItems = request.queryItems }
        return URLRequest(url: urlComponent.url!)
    }
    
    internal func configRequestMethods(request: RequestProtocol, urlRequest: inout URLRequest) {
        switch request.httpMethod {
        case .post:
            request.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
            urlRequest.httpMethod = request.httpMethod.rawValue
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: request.parameters, options: [])
        case .get:()
        case .patch:()
        case .put:()
        case .delete:()
        }
    }
    
    internal func urlSessionRequest<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        print(T.self)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
        .print()
        .map { $0.data }
        .mapError(ServiceError.responseError)
        .decode(type: T.self, decoder: JSONDecoder())
        .mapError(ServiceError.parseError)
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}


