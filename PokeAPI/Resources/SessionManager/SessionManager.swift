//
//  SessionManager.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import Foundation

class SessionManager: ObservableObject {
    @Published var isLoggedIn: Bool
    
    init() {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func login() {
        isLoggedIn = true
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    func logout() {
        isLoggedIn = false
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
}
