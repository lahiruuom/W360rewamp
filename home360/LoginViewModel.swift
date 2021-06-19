//
//  LoginViewModel.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import Foundation
import Combine

protocol LoginViewModelProtocol: Any {
    var manager: LoginRemoteDataManagerProtocol? { get set }
    var persistance: PersistanceProtocol? { get set }
}

class LoginViewModel: ObservableObject, LoginViewModelProtocol {
    private var cancellables: [AnyCancellable?] = []
    
    var manager: LoginRemoteDataManagerProtocol?
    
    var persistance: PersistanceProtocol?
    
    @Published var username = "lahiru@w360.asia"
    @Published var password = "webtics123"
    @Published var loginType = ""
    @Published var thirdPartyToken = ""
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
    
    func login() {
        loadingState.isLoading = true
        let credential = Credential(loginType: loginType, email: username, password: password, thirdPartyToken: thirdPartyToken)
        let responsePublisher = manager?.login(credential)
            .print()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error)
                    self?.isAlertPresented = true
                case .finished:
                    self?.isLoginSuccess = true
                }
                self?.loadingState.isLoading = false
            }, receiveValue: { response in
                if response.error {
                    self.errorMessage = response.message
                    self.isAlertPresented = true
                    return
                }
                self.loadingState.isLoading = false
            })
        cancellables += [responsePublisher]
    }
    
}
