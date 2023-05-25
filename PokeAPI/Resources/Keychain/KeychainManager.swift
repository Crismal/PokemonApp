//
//  KeychainManager.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import Foundation
import KeychainSwift

class KeychainManager {
    
    private let keychainAccessGroup = "com.cristianalmendro.pokeapi.user"
    
    private enum Keys: String {
        case currentUser = "currentUser"
    }

    func saveCurrentUser(currentUser: CurrentUser) {
        let keychain = KeychainSwift()
        if let userData = getDataFromCurrentUser(with: currentUser) {
            keychain.set(userData, forKey: Keys.currentUser.rawValue)
        }
    }

    func getCurrentUser() -> CurrentUser? {
        let keychain = KeychainSwift()
        let currentUserData = keychain.getData(Keys.currentUser.rawValue)
        if let currentUserData = currentUserData {
            return getCurrentUserFromData(with: currentUserData)
        }
        return nil
    }

    func deleteCurrentUser() {
        let keychain = KeychainSwift()
        keychain.delete(Keys.currentUser.rawValue)
    }

    private func getDataFromCurrentUser(with currentUser: CurrentUser) -> Data? {
        do {
            let data = try PropertyListEncoder.init().encode(currentUser)
            return data
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        return nil
    }

    private func getCurrentUserFromData(with data: Data) -> CurrentUser? {
        do {
            let user = try PropertyListDecoder.init().decode(CurrentUser.self, from: data)
            return user
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        return nil
    }

    func convertStructToDictionary(instance: Any) -> [String: Any]? {
        let mirror = Mirror(reflecting: instance)
        guard mirror.displayStyle == .struct else { return nil }
        var dict = [String: Any]()
        for case let (label?, value) in mirror.children {
            dict[label] = value
        }
        return dict
    }
}
