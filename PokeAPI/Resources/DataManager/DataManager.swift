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
    
    func getPokemons(_ completion: @escaping (Result<PokemonResult, Error>) -> Void) {
        if let pokemons = realm.getAllObjects(PokemonResult.self) {
            if pokemons.isEmpty {
                service.request(endPoint: "pokemon", method: .get) { (result: Result<PokemonResult, Error>) in
                    switch result {
                    case .success(let success):
                        self.saveObject(object: success)
                        completion(.success(success))
                    case .failure(let failure):
                        print(failure)
                        completion(.failure(failure))
                    }
                }
            } else {
                completion(.success(pokemons.first!))
            }
        }
    }
    
    func getPokemonDetail(pokemonId: Int, _ completion: @escaping (Result<PokemonDetail, Error>) -> Void) {
//        if let pokemons = realm.getObject(PokemonDetail.self, primaryKey: "\(pokemonId)") {
//            completion(.success(pokemons))
//        } else {
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
//        }
      
    }
    
    func getPokemonSpecies(pokemonId: Int, _ completion: @escaping (Result<PokemonSpecie, Error>) -> Void) {
        service.request(endPoint: "pokemon-species/\(pokemonId)", method: .get) { (result: Result<PokemonSpecie, Error>) in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                print(failure)
                completion(.failure(failure))
            }
        }
    }
    
    func getPokemonGeneration(generationId: Int, _ completion: @escaping (Result<PokemonGeneration, Error>) -> Void) {
        service.request(endPoint: "generation/\(generationId)", method: .get) { (result: Result<PokemonGeneration, Error>) in
            switch result {
            case .success(let success):
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
    
    func saveObject<T: Object>(object: T) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.realm.saveObject(object)
        }
    }
    
}
