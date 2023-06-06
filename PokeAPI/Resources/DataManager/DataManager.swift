//
//  DataManager.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 23/5/23.
//

import Foundation
import RealmSwift

class DataManager {
    static let shared = DataManager()
    private let realm = RealmDataManager()
    private let service = PokeAPIService()
    private var timer: DispatchSourceTimer?
    private let queue = DispatchQueue.global(qos: .userInitiated)
    
    init() {
        startTimer()
    }
    
    deinit {
        stopAPIThreading()
    }
    
    func getLogin(email: String, password: String, _ completion: @escaping (Result<CurrenUsers, Error>) -> Void) {
        service.requestLogin(endPoint: "", method: .get) { (result: Result<CurrenUsers, Error>) in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                print(failure)
                completion(.failure(failure))
            }
        }
    }
    
    func getPokemons(_ completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        if let pokemons = realm.getAllObjects(Pokemon.self) {
            if pokemons.isEmpty {
                service.request(endPoint: "pokemon", method: .get) { (result: Result<PokemonResult, Error>) in
                    switch result {
                    case .success(let success):
                        self.saveObjects(object: success.pokemons)
                        completion(.success(success.pokemons))
                    case .failure(let failure):
                        print(failure)
                        completion(.failure(failure))
                    }
                }
            } else {
                completion(.success(Array(pokemons.prefix(20))))
            }
        }
    }
    
    func getMorePokemons(offset: Int, _ completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        if let pokemons = realm.getAllObjects(Pokemon.self) {
            let pokemonsArray = Array(pokemons).filter { $0.getComputedId() ?? 0 > offset && $0.getComputedId() ?? 0 <= offset + 5 }
            if pokemonsArray.isEmpty {
                service.request(endPoint: "pokemon/?offset=\(offset)&limit=5", method: .get) { (result: Result<PokemonResult, Error>) in
                    switch result {
                    case .success(let success):
                        self.saveObjects(object: success.pokemons)
                        completion(.success(success.pokemons))
                    case .failure(let failure):
                        print(failure)
                        completion(.failure(failure))
                    }
                }
            } else {
                completion(.success(pokemonsArray))
            }
        }
    }
    
    private func getDetails(pokemons: [Pokemon]) {
        for pokemon in pokemons {
            if let id = pokemon.getComputedId() {
                getPokemonDetail(pokemonId: id) { _ in }
                getPokemonSpecies(pokemonId: id)  { _ in }
            }
        }
    }
    
    func getPokemonsByThread() {
        if let pokemons = realm.getAllObjects(Pokemon.self) {
            let offset = pokemons.count + 1
            let pokemonsArray = Array(pokemons).filter { $0.getComputedId() ?? 0 > offset && $0.getComputedId() ?? 0 <= offset + 5 }
            if pokemonsArray.isEmpty {
                service.request(endPoint: "pokemon/?offset=\(offset)&limit=5", method: .get) { (result: Result<PokemonResult, Error>) in
                    switch result {
                    case .success(let success):
                        if success.next == nil || success.count == 0 {
                            self.stopAPIThreading()
                            return
                        }
                        self.saveObjects(object: success.pokemons)
                        self.getDetails(pokemons: success.pokemons)
                        
                    case .failure(let failure):
                        print(failure)
                        self.stopAPIThreading()
                    }
                }
            }
        }
    }
    
    func searchPokemons(searchText: String,  _ completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        if let pokemons = realm.getAllObjects(Pokemon.self) {
            let filteredPokemons = Array(pokemons).filter( { $0.name.contains(searchText.lowercased()) || "\($0.getComputedId() ?? 0)" == searchText})
            completion(.success(Array(filteredPokemons)))
        }
    }
    
    func getPokemonDetail(pokemonId: Int, _ completion: @escaping (Result<PokemonDetail, Error>) -> Void) {
        if let pokemonDetail = realm.getAllObjects(PokemonDetail.self)?.where( { $0.id == pokemonId}).first {
            completion(.success(pokemonDetail))
        } else {
            service.request(endPoint: "pokemon/\(pokemonId)", method: .get) { (result: Result<PokemonDetail, Error>) in
                switch result {
                case .success(let success):
                    self.saveObject(object: success)
                    completion(.success(success))
                case .failure(let failure):
                    print(failure)
                    completion(.failure(failure))
                }
            }
        }
    }
    
    func getPokemonSpecies(pokemonId: Int, _ completion: @escaping (Result<PokemonSpecie, Error>) -> Void) {
        if let pokemonSpecie = realm.getAllObjects(PokemonSpecie.self)?.where( { $0.id == pokemonId}).first {
            completion(.success(pokemonSpecie))
        } else {
            service.request(endPoint: "pokemon-species/\(pokemonId)", method: .get) { (result: Result<PokemonSpecie, Error>) in
                switch result {
                case .success(let success):
                    self.saveObject(object: success)
                    completion(.success(success))
                case .failure(let failure):
                    print(failure)
                    completion(.failure(failure))
                }
            }
        }
    }
    
    func getPokemonGeneration(generationId: Int, _ completion: @escaping (Result<PokemonGeneration, Error>) -> Void) {
        if let pokemonGeneration = realm.getAllObjects(PokemonGeneration.self)?.where( { $0.id == generationId}).first {
            completion(.success(pokemonGeneration))
        } else {
            service.request(endPoint: "generation/\(generationId)", method: .get) { (result: Result<PokemonGeneration, Error>) in
                switch result {
                case .success(let success):
                    self.saveObject(object: success)
                    completion(.success(success))
                case .failure(let failure):
                    print(failure)
                    completion(.failure(failure))
                }
            }
        }
    }
    
    func getPokemonEvolution(pokemonId: Int, _ completion: @escaping (Result<PokemonEvolution, Error>) -> Void) {
        service.request(endPoint: "evolution-chain/\(pokemonId)", method: .get) { (result: Result<PokemonEvolution, Error>) in
            switch result {
            case .success(let success):
                print(success)
                completion(.success(success))
            case .failure(let failure):
                print(failure)
                completion(.failure(failure))
            }
        }
    }
}

// MARK: Realm Functions

extension DataManager {
    
    func saveObject<T: RealmSwift.Object>(object: T) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.realm.saveObject(object)
        }
    }
    
    func saveObjects<T: RealmSwift.Object>(object: [T]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.realm.saveObjects(object)
        }
    }
    
}

extension DataManager {
    
    private func startTimer() {
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer?.schedule(deadline: .now(), repeating: .seconds(5))
        timer?.setEventHandler { [weak self] in
            self?.getPokemonsByThread()
        }
        timer?.resume()
    }
    
    private func stopAPIThreading() {
        timer?.cancel()
        timer = nil
    }
    
}
