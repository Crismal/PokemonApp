//
//  ContentView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 16/5/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var sessionManager = SessionManager()
    
    var body: some View {
        
        VStack {
            if !sessionManager.isLoggedIn {
                LoginView(sessionManager: sessionManager)
            } else {
                MainScreenView(sessionManager: sessionManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
