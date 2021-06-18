//
//  RegisterViewModel.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation
import Combine

protocol RegisterViewModelProtocol: Any {
    var manager: LoginRemoteDataManagerProtocol? { get set }
    var persistance: PersistanceProtocol? { get set }
}

class RegisterViewModel: ObservableObject, RegisterViewModelProtocol {
    private var cancellables: [AnyCancellable?] = []
    
    var manager: LoginRemoteDataManagerProtocol?
    
    var persistance: PersistanceProtocol?
    
    @Published var givenName = ""
    @Published var surname = ""
    @Published var email = ""
    @Published var password = ""
    @Published var isLoginSuccess: Bool = false
    @Published var isAlertPresented: Bool = false
    @Published var errorMessage: String = ""
    internal var loadingState: LoadingStateProtocol
    
    init(manager: LoginRemoteDataManagerProtocol = LoginRemoteDataManager(),
         persistance: PersistanceProtocol = Persistance() , loading: LoadingStateProtocol = LoadingState()) {
        self.manager = manager
        self.persistance = persistance
        self.loadingState = loading
    }
    
}
