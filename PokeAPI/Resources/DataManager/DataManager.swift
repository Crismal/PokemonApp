//
//  DataManager.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 23/5/23.
//

import Foundation

class DataManager {
    static let shared = DataManager()
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
        service.request(endPoint: "pokemon", method: .get) { (result: Result<PokemonResult, Error>) in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                print(failure)
                completion(.failure(failure))
            }
        }
    }
    
    func getPokemonDetail(pokemonId: Int, _ completion: @escaping (Result<PokemonDetail, Error>) -> Void) {
        service.request(endPoint: "pokemon/\(pokemonId)", method: .get) { (result: Result<PokemonDetail, Error>) in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                print(failure)
                completion(.failure(failure))
            }
        }
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
