//
//  PokemonDetailViewModel.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 18/5/23.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    
    @Published var pokemonDetail: PokemonDetail?
    private let dataManager = DataManager.shared
    
    func getPokemonDetail(pokemonId: Int) {
        dataManager.getPokemonDetail(pokemonId: pokemonId) { [weak self] (result: Result<PokemonDetail, Error>) in
            guard let self = self else { return }
             
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonDetail = success
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
