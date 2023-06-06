//
//  PokemonEvolution.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 30/5/23.
//

import Foundation

// MARK: - PokemonEvolution
struct PokemonEvolution: Codable {
    let babyTriggerItem: String?
    let chain: Chain
    let id: Int

    enum CodingKeys: String, CodingKey {
        case babyTriggerItem = "baby_trigger_item"
        case chain
        case id
    }
}

// MARK: - Chain
struct Chain: Codable {
    let evolutionDetails: [EvolutionDetail]
    let evolvesTo: [ChainEvolvesTo]
    let isBaby: Bool
    let species: Species

    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}

// MARK: - ChainEvolvesTo
struct ChainEvolvesTo: Codable, Identifiable {
    var id = UUID().uuidString
    let evolutionDetails: [EvolutionDetail]
    let evolvesTo: [EvolvesToEvolvesTo]
    let isBaby: Bool
    let species: Species

    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}

// MARK: - EvolutionDetail
struct EvolutionDetail: Codable, Identifiable {
    var id = UUID().uuidString
    let gender: String?
    let heldItem: String?
    let item: Species?
    let knownMove: String?
    let knownMoveType: String?
    let location: String?
    let minAffection: String?
    let minBeauty: String?
    let minHappiness: String?
    let minLevel: Int
    let needsOverworldRain: Bool
    let partySpecies: String?
    let partyType: String?
    let relativePhysicalStats: String?
    let timeOfDay: String
    let tradeSpecies: String?
    let trigger: Species
    let turnUpsideDown: Bool

    enum CodingKeys: String, CodingKey {
        case gender
        case heldItem = "held_item"
        case item
        case knownMove = "known_move"
        case knownMoveType = "known_move_type"
        case location
        case minAffection = "min_affection"
        case minBeauty = "min_beauty"
        case minHappiness = "min_happiness"
        case minLevel = "min_level"
        case needsOverworldRain = "needs_overworld_rain"
        case partySpecies = "party_species"
        case partyType = "party_type"
        case relativePhysicalStats = "relative_physical_stats"
        case timeOfDay = "time_of_day"
        case tradeSpecies = "trade_species"
        case trigger
        case turnUpsideDown = "turn_upside_down"
    }
}

// MARK: - EvolvesToEvolvesTo
struct EvolvesToEvolvesTo: Codable {
    let evolutionDetails: [EvolutionDetail]
    let evolvesTo: [String]
    let isBaby: Bool
    let species: Species

    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}
