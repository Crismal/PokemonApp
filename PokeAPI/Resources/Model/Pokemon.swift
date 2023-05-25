//
//  Pokemon.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 16/5/23.
//

import Foundation

// MARK: - Welcome
struct PokemonResult: Codable {
    let count: Int
    let next: String
    let pokemons: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case pokemons = "results"
    }
}

// MARK: - Result
struct Pokemon: Codable, Identifiable {
    let name: String
    let url: String
    let id: String = UUID().uuidString
    
    var computedId: Int? {
        guard let numberString = url.split(separator: "/").last else {
            return nil
        }
        
        return Int(numberString)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
