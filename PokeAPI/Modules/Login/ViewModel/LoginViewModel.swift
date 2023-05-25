//
//  LoginViewModel.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let dataManage = DataManager.shared
    private let keychainManager: KeychainManager
    
    init() {
        keychainManager = KeychainManager()
    }
    
    func getLogin(email: String, password: String, completion: @escaping (Bool, String) -> ()) {
        dataManage.getLogin(email: email, password: password) { [weak self] (result: Result<CurrenUsers, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                if let user = success.first {
                    self.saveUserInKeychain(user: user)
                    completion(true, "")
                }
            case .failure(let failure):
                completion(false, failure.localizedDescription)
            }
        }
    }
    
    private func saveUserInKeychain(user: CurrentUser) {
        keychainManager.saveCurrentUser(currentUser: user)
        
        if let user = keychainManager.getCurrentUser() {
            print(user.createdAt)
            print(user.email)
            print(user.id)
            print(user.password)
        }
    }
}
