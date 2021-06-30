//
//  RegisterViewModel.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation
import Combine
import FacebookLogin

protocol RegisterViewModelProtocol: Any {
    var manager: RegisterRemoteDataManager? { get set }
    var persistance: PersistanceProtocol? { get set }
}

class RegisterViewModel: ObservableObject, RegisterViewModelProtocol {
    private var cancellables: [AnyCancellable?] = []
    
    var manager: RegisterRemoteDataManager?
    var persistance: PersistanceProtocol?
    let loginManager = LoginManager()
    
    @Published var givenName = ""
    @Published var surname = ""
    @Published var email = ""
    @Published var loginType = ""
    @Published var socialUserId = ""
    @Published var profileImageUrl = ""
    @Published var password = ""
    @Published var confirmPassword = ""
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
    
    func facebookRegister() {
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
            switch loginResult {
            case .failed(let error):
                self.errorMessage = error.localizedDescription
                self.isAlertPresented = true
            case .cancelled:
                self.errorMessage = "User cancelled login."
                self.isAlertPresented = true
            case .success(_, _, let accessToken):
                GraphRequest(graphPath: "me",
                             parameters: ["fields":"id,first_name,last_name,email,picture.width(100).height(100)"])
                    .start { connection, result, error in
                    if let result = result {
                        let data = result as! [String : AnyObject]
                        self.socialUserId = data["id"] as? String ?? ""
                        self.givenName = data["first_name"] as? String ?? ""
                        self.surname = data["last_name"] as? String ?? ""
                        self.email = data["email"] as? String ?? ""
                        self.loginType = "Facebook"
                        let picture = data["picture"]?["data"] as AnyObject
                        if let url = picture["url"] as? String {
                            self.profileImageUrl = url
                        }
                        self.providerToken = accessToken!.tokenString
                        self.register()
                    } else{
                        self.errorMessage = error?.localizedDescription ?? ""
                        self.isAlertPresented = true
                    }
                }
            }
        }
    }
}
