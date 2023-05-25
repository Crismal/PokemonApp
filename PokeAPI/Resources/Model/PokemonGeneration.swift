//
//  PokemonGeneration.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 24/5/23.
//

import Foundation

// MARK: - PokemonGeneration
struct PokemonGeneration: Codable {
    let abilities: [PokemonColor]
    let id: Int
    let mainRegion: PokemonColor
    let moves: [PokemonColor]
    let name: String
    let names: [GenerationName]
    let pokemonSpecies: [PokemonColor]
    let types: [PokemonColor]
    let versionGroups: [PokemonColor]

    enum CodingKeys: String, CodingKey {
        case abilities
        case id
        case mainRegion = "main_region"
        case moves
        case name
        case names
        case pokemonSpecies = "pokemon_species"
        case types
        case versionGroups = "version_groups"
    }
}

// MARK: - Name
struct GenerationName: Codable {
    let language: PokemonColor
    let name: String

    enum CodingKeys: String, CodingKey {
        case language
        case name
    }
}
