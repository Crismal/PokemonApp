//
//  PokemonDetailViewModel.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 18/5/23.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    
    @Published var pokemonEvolution: PokemonEvolution?
    private let dataManager = DataManager.shared
    
    func getPokemonEvolution(pokemonId: Int) {
        dataManager.getPokemonEvolution(pokemonId: pokemonId) { [weak self] (result: Result<PokemonEvolution, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonEvolution = success
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
