//
//  PokemonSpecie.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 24/5/23.
//

import Foundation

// MARK: - PokemonSpecie
struct PokemonSpecie: Codable {
    let baseHappiness: Int
    let captureRate: Int
    let color: PokemonColor
    let eggGroups: [PokemonColor]
    let evolutionChain: EvolutionChain
    let evolvesFromSpecies: PokemonColor?
    let flavorTextEntries: [FlavorTextEntry]
    let formDescriptions: [String]
    let formsSwitchable: Bool
    let genderRate: Int
    let genera: [Genus]
    let generation: Generation
    let growthRate: PokemonColor
    let habitat: PokemonColor
    let hasGenderDifferences: Bool
    let hatchCounter: Int
    let id: Int
    let isBaby: Bool
    let isLegendary: Bool
    let isMythical: Bool?
    let name: String
    let names: [Name]
    let order: Int
    let palParkEncounters: [PalParkEncounter]
    let pokedexNumbers: [PokedexNumber]
    let shape: PokemonColor
    let varieties: [Variety]

    enum CodingKeys: String, CodingKey {
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case color
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera
        case generation
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case id
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case name
        case names
        case order
        case palParkEncounters = "pal_park_encounters"
        case pokedexNumbers = "pokedex_numbers"
        case shape
        case varieties
    }
}

// MARK: - Color
struct Generation: Codable {
    let name: String
    let url: String
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

// MARK: - Color
struct PokemonColor: Codable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let url: String

    enum CodingKeys: String, CodingKey {
        case url
    }
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String
    let language: PokemonColor
    let version: PokemonColor

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case version
    }
}

// MARK: - Genus
struct Genus: Codable {
    let genus: String
    let language: PokemonColor

    enum CodingKeys: String, CodingKey {
        case genus
        case language
    }
}

// MARK: - Name
struct Name: Codable {
    let language: PokemonColor
    let name: String

    enum CodingKeys: String, CodingKey {
        case language
        case name
    }
}

// MARK: - PalParkEncounter
struct PalParkEncounter: Codable {
    let area: PokemonColor
    let baseScore: Int
    let rate: Int

    enum CodingKeys: String, CodingKey {
        case area
        case baseScore = "base_score"
        case rate
    }
}

// MARK: - PokedexNumber
struct PokedexNumber: Codable {
    let entryNumber: Int
    let pokedex: PokemonColor

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
}

// MARK: - Variety
struct Variety: Codable {
    let isDefault: Bool
    let pokemon: PokemonColor

    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
}
