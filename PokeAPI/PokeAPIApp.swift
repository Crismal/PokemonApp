//
//  PokeAPIApp.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 16/5/23.
//

import SwiftUI

@available(iOS 14.0, *)
@main
struct PokeAPIApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIContraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}
