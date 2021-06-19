//
//  RegisterRemoteDataManager.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-19.
//

import Foundation
import Combine

protocol RegisterRemoteDataManagerProtocal {
    var requestService: RequestServiceProtocol { get  set}
    func register (_ register: Register)  -> AnyPublisher<HomeResponse<RegisterRes>, Error>
}

class RegisterRemoteDataManager: RegisterRemoteDataManagerProtocal {
    var requestService: RequestServiceProtocol
    
    init(_ requestService: RequestServiceProtocol = RequestService()) {
        self.requestService = requestService
    }
    
    func register(_ register: Register) -> AnyPublisher<HomeResponse<RegisterRes>, Error> {
        let result = requestService.fetchData(request: AuthEndpoint.register(register)) as AnyPublisher<HomeResponse<RegisterRes>, Error>
        return result
            .print()
            .map{$0}
            .eraseToAnyPublisher()
    }
}
