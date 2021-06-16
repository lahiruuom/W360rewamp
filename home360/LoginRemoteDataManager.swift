import Foundation
import Combine

protocol LoginRemoteDataManagerProtocol {
    var requestService: RequestServiceProtocol { get set }
    func login(_ credential: Credential) -> AnyPublisher<LoginResponse, Error>
}

final class LoginRemoteDataManager: LoginRemoteDataManagerProtocol {
    
    internal var requestService: RequestServiceProtocol
    
    init(_ requestService: RequestServiceProtocol = RequestService()) {
        self.requestService = requestService
    }
    
    func login(_ credential: Credential) -> AnyPublisher<LoginResponse, Error> {
        let result = requestService.fetchData(request: AuthEndpoint.login(credential)) as AnyPublisher<LoginResponse, Error>
        return result
            .print()
            .map {$0}
            .eraseToAnyPublisher()
    }
    
}

