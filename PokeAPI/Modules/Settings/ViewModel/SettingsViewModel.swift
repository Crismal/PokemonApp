//
//  SettingsViewModel.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 18/5/23.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    let keychainManager: KeychainManager
    let currentUser: CurrentUser?
    
    init() {
        keychainManager = KeychainManager()
        currentUser = keychainManager.getCurrentUser()
    }
    
    func logout() {
        keychainManager.deleteCurrentUser()
    }
}
