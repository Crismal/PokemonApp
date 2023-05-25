//
//  MainScreenViewModel.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 16/5/23.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    
    private let dataManager = DataManager.shared
    private let keychainManager: KeychainManager
    private var pokemonResult: PokemonResult?
    @Published var pokemonDetail: [PokemonDetail] = []
    @Published var pokemonSpecie: [PokemonSpecie] = []
    @Published var pokemonGeneration: [PokemonGeneration] = []
    
    init() {
        keychainManager = KeychainManager()
    }
    
    func getPokemons() {
        dataManager.getPokemons() { [weak self] (result: Result<PokemonResult, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonResult = success
                    self.getDetails()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func getDetails() {
        guard let pokemons = pokemonResult?.pokemons else { return }
        for pokemon in pokemons {
            if let id = pokemon.computedId {
                if !pokemonDetail.contains(where: { $0.id == id }) {
                    getPokemonDetail(pokemonId: id)
                }
                if !pokemonSpecie.contains(where: { $0.id == id }) {
                    getPokemonSpecies(pokemonId: id)
                }
            }
        }
    }
    
    func getPokemonDetail(pokemonId: Int) {
        dataManager.getPokemonDetail(pokemonId: pokemonId) { [weak self] (result: Result<PokemonDetail, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonDetail.append(success)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getPokemonSpecies(pokemonId: Int) {
        dataManager.getPokemonSpecies(pokemonId: pokemonId) { [weak self] (result: Result<PokemonSpecie, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonSpecie.append(success)
                    self.getGenerations()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getGenerations() {
        for specie in pokemonSpecie {
            if !pokemonGeneration.contains(where: { $0.id == specie.generation.computedId }) {
                if let id = specie.generation.computedId {
                    getPokemonGeneration(generationId: id)
                }
            }
        }
    }
    
    func getPokemonGeneration(generationId: Int) {
        dataManager.getPokemonGeneration(generationId: generationId) { [weak self] (result: Result<PokemonGeneration, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemonGeneration.append(success)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getPokemonDetailFromList(pokemonId: Int) -> PokemonDetail? {
        return pokemonDetail.first(where: { $0.id == pokemonId })
    }
    
    
    func getPokemonSpecie(pokemonId: Int) -> PokemonSpecie? {
        return pokemonSpecie.first(where: { $0.id == pokemonId })
    }
    
    func getPokemonRegion(pokemonId: Int) -> String {
        if let pokemonSpecie = pokemonSpecie.first(where: { $0.id == pokemonId }) {
            if let generation = pokemonGeneration.first(where: { $0.id == pokemonSpecie.generation.computedId }) {
                return generation.mainRegion.name
            }
        }
        return ""
    }
    
    func logout() {
        keychainManager.deleteCurrentUser()
    }
}
