//
//  RegisterViewModel.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation
import Combine

protocol RegisterViewModelProtocol: Any {
    var manager: RegisterRemoteDataManager? { get set }
    var persistance: PersistanceProtocol? { get set }
}

class RegisterViewModel: ObservableObject, RegisterViewModelProtocol {
    private var cancellables: [AnyCancellable?] = []
    
    var manager: RegisterRemoteDataManager?
    
    var persistance: PersistanceProtocol?
    
    @Published var givenName = "adsfasfa"
    @Published var surname = "asfasfasf"
    @Published var email = "asfaf@gmail.com"
    @Published var loginType = "basic"
    @Published var socialUserId = ""
    @Published var profileImageUrl = ""
    @Published var password = "ddsads"
    @Published var confirmPassword = "ddsads"
    @Published var providerToken = ""
    @Published var isRegisterSuccess: Bool = false
    @Published var isAlertPresented: Bool = false
    @Published var errorMessage: String = ""
    internal var loadingState: LoadingStateProtocol
    
    init(manager: RegisterRemoteDataManager = RegisterRemoteDataManager(),
         persistance: PersistanceProtocol = Persistance() , loading: LoadingStateProtocol = LoadingState()) {
        self.manager = manager
        self.persistance = persistance
        self.loadingState = loading
    }
    
    func validatePasswordAndRegister() {
        if password == confirmPassword {
            register()
        } else{
            isAlertPresented = true
            errorMessage = "Password doesn't match"
        }
    }
    
    func register() {
        self.loadingState.isLoading = true
        let register = Register(givenName: givenName, surname: surname, email: email, password: password, loginType: loginType, socialUserId: socialUserId, profileImageUrl: profileImageUrl, providerToken: providerToken)
        let responsePublisher = manager?.register(register)
            .print()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    if let errorObject = error as? HomeError {
                        self?.errorMessage = errorObject.message
                        self?.isAlertPresented = true
                    }
                case .finished:
                    self?.isRegisterSuccess = true
                }
                self?.loadingState.isLoading = false
            }, receiveValue: { response in
                self.loadingState.isLoading = false
            })
        cancellables += [responsePublisher]
    }
    
}
