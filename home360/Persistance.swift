//
//  Persistance.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-13.
//

import KeychainSwift

enum KeyChainName: String, CaseIterable {
    case keychain_refresh_token
    case keychain_access_token
    case keychain_accountID
    
    static let allValues = KeyChainName.allCases
}

protocol PersistanceProtocol: AnyObject {
    func setKeychain(data: String?, _ forKey: KeyChainName)
    func getKeychain(key: KeyChainName) -> String?
    func deleteKeychain(_ key: KeyChainName)
    func deleteAllKeyChains()
    func isKeyChainExist(_ key: KeyChainName) -> Bool
    
}

class Persistance: PersistanceProtocol {
    
    let keychain = KeychainSwift()
    
    func setKeychain(data: String?, _ forKey: KeyChainName) {
        guard let keyData = data else { return print("keychain not found")}
        keychain.set(keyData, forKey: forKey.rawValue)
    }
    
    func getKeychain(key: KeyChainName) -> String? {
        return keychain.get(key.rawValue)
    }
    
    func deleteKeychain(_ key: KeyChainName) {
        keychain.delete(key.rawValue)
    }
    
    func deleteAllKeyChains() {
        KeyChainName.allValues.forEach { keychain.delete($0.rawValue) }
    }
    
    func isKeyChainExist(_ key: KeyChainName) -> Bool {
        guard keychain.get(key.rawValue) != nil else { return false}
        return true
    }
}

