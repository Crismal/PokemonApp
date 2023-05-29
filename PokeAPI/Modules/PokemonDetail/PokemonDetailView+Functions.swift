//
//  PokemonDetailView+Functions.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 26/5/23.
//

import Foundation

extension PokemonDetailView {
    
    func showView(showAbout: Bool, showStats: Bool, showEvolution: Bool) {
        self.showAbout = showAbout
        self.showStats = showStats
        self.showEvolution = showEvolution
    }
}
