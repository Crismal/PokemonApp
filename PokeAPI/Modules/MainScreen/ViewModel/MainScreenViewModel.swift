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
    private var pokemons: [Pokemon] = []
    @Published var pokemonDetail: [PokemonDetail] = []
    @Published var pokemonSpecie: [PokemonSpecie] = []
    @Published var pokemonGeneration: [PokemonGeneration] = []
    @Published var isLoading = false
    var generations = [Generation]()
    var isSearching = false
    
    init() {
        keychainManager = KeychainManager()
    }
    
    func getPokemons() {
        isLoading = true
        dataManager.getPokemons() { [weak self] (result: Result<[Pokemon], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemons = success.sorted{ $0.getComputedId() ?? 0 < $1.getComputedId() ?? 0 }
                    self.getDetails()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func getDetails() {
        for pokemon in pokemons {
            if let id = pokemon.getComputedId() {
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
                    self.pokemonDetail = self.pokemonDetail.sorted { $0.id < $1.id}
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
            if !pokemonGeneration.contains(where: { $0.id == specie.generation?.getComputedId() }) {
                if let id = specie.generation?.getComputedId() {
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
        self.isLoading = false
    }
    
    func getMorePokemons() {
        let offset = pokemons.count
        dataManager.getMorePokemons(offset: offset) { [weak self] (result: Result<[Pokemon], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.pokemons.append(contentsOf: success.sorted{ $0.getComputedId() ?? 0 < $1.getComputedId() ?? 0 })
                    self.getDetails()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func loadMoreData(currentPokemon: PokemonDetail) {
        guard let lastPokemon = pokemonDetail.last, !isSearching else { return }
        
        if lastPokemon == currentPokemon {
            getMorePokemons()
        }
    }
    
    func seachPokemon(searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            getPokemons()
            isLoading = false
        } else {
            isSearching = true
            pokemons = []
            pokemonDetail = []
            dataManager.searchPokemons(searchText: searchText) { [weak self] (result : Result<[Pokemon], Error>) in
                guard let self = self else { return }
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.pokemons = success
                        self.getDetails()
                    }
                case .failure(let failure):
                    print(failure)
                }
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
            if let generation = pokemonGeneration.first(where: { $0.id == pokemonSpecie.generation?.getComputedId() }) {
                return generation.mainRegion?.name ?? ""
            }
        }
        return ""
    }
    
    func logout() {
        keychainManager.deleteCurrentUser()
    }
}
