//
//  LoginViewModel.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import Foundation
import Combine
import FacebookLogin
import GoogleSignIn

protocol LoginViewModelProtocol: Any {
    var manager: LoginRemoteDataManagerProtocol? { get set }
    var persistance: PersistanceProtocol? { get set }
    func login()
    func facebookLogin()
    func googleSignIn()
    func attemptAppleSignIn()
}

class LoginViewModel: NSObject, ObservableObject, LoginViewModelProtocol {
    private var cancellables: [AnyCancellable?] = []
    
    var manager: LoginRemoteDataManagerProtocol?
    var persistance: PersistanceProtocol?
    let loginManager = LoginManager()
    private lazy var appleSignInCoordinator = AppleSignInCoordinator(loginVM: self, registerMV: RegisterViewModel())
    
    @Published var username = ""
    @Published var password = ""
    @Published var credential: Credential!
    @Published var isLoginSuccess: Bool = false
    @Published var isAlertPresented: Bool = false
    @Published var errorMessage: String = ""
    
    internal var loadingState: LoadingStateProtocol
    private static let cache = Cache<String, User>()
    
    init(manager: LoginRemoteDataManagerProtocol = LoginRemoteDataManager(),
         persistance: PersistanceProtocol = Persistance() , loading: LoadingStateProtocol = LoadingState()) {
        self.manager = manager
        self.persistance = persistance
        self.loadingState = loading
    }
    
    func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func login() {
        loadingState.isLoading = true
        let responsePublisher = manager?.login(credential)
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
                    self?.isLoginSuccess = true
                }
                self?.loadingState.isLoading = false
            }, receiveValue: { response in
                self.persistance?.setKeychain(data: response.payload.accessToken, .keychain_access_token)
                self.persistance?.setKeychain(data: response.payload.refreshToken, .keychain_refresh_token)
                if let user = response.payload.user {
                    LoginViewModel.cache.insert(user, forKey: "USER")
                }
                self.loadingState.isLoading = false
            })
        cancellables += [responsePublisher]
    }
    
    func facebookLogin() {
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
            switch loginResult {
            case .failed(let error):
                self.errorMessage = error.localizedDescription
                self.isAlertPresented = true
            case .cancelled:
                self.errorMessage = "User cancelled login."
                self.isAlertPresented = true
            case .success(_, _, let accessToken):
                GraphRequest(graphPath: "me", parameters: ["fields":"id,first_name,last_name,email,picture.width(100).height(100)"]).start { [self] connection, result, error in
                    if let result = result {
                        let data = result as! [String : AnyObject]
                        self.credential = Credential(loginType: "Facebook", email: data["email"] as? String ?? "", password: "", thirdPartyToken: accessToken!.tokenString)
                        self.login()
                    } else{
                        self.errorMessage = error?.localizedDescription ?? ""
                        self.isAlertPresented = true
                    }
                }
            }
        }
    }
    
    func googleSignIn() {
        if GIDSignIn.sharedInstance().currentUser == nil {
            GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
    func attemptAppleSignIn() {
        appleSignInCoordinator.handleAuthorizationAppleIDButtonPress()
    }
    
}

extension LoginViewModel: GIDSignInDelegate {
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            debugPrint(error.localizedDescription)
            return
        }
        self.credential = Credential(loginType: "google", email:user.profile.email, password: "", thirdPartyToken: user.authentication.idToken)
    }
}
