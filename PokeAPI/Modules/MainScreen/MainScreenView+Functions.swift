//
//  MainScreenView+Functions.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import Foundation

extension MainScreenView {
    func logout() {
        sessionManager.logout()
        viewModel.logout()
    }
}
