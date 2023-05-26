//
//  PokemonSpecie.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 24/5/23.
//

import Foundation
import RealmSwift

// MARK: - PokemonSpecie
class PokemonSpecie: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var baseHappiness: Int = 0
    @objc dynamic var captureRate: Int = 0
    @objc dynamic var color: PokemonColor?
    var eggGroups = List<PokemonColor>()
    @objc dynamic var evolutionChain: EvolutionChain?
    @objc dynamic var evolvesFromSpecies: PokemonColor?
    var flavorTextEntries = List<FlavorTextEntry>()
    var formDescriptions = List<String>()
    @objc dynamic var formsSwitchable: Bool = false
    @objc dynamic var genderRate: Int = 0
    var genera = List<Genus>()
    @objc dynamic var generation: Generation?
    @objc dynamic var growthRate: PokemonColor?
    @objc dynamic var habitat: PokemonColor?
    @objc dynamic var hasGenderDifferences: Bool = false
    @objc dynamic var hatchCounter: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var isBaby: Bool = false
    @objc dynamic var isLegendary: Bool = false
    @objc dynamic var isMythical: Bool = false
    @objc dynamic var name: String = ""
    var names = List<Name>()
    @objc dynamic var order: Int = 0
    var palParkEncounters = List<PalParkEncounter>()
    var pokedexNumbers = List<PokedexNumber>()
    @objc dynamic var shape: PokemonColor?
    var varieties = List<Variety>()
    
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
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - Color
class Generation: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    func getComputedId() -> Int? {
        guard let numberString = url.split(separator: "/").last else {
            return nil
        }
        
        return Int(numberString)
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - Color
class PokemonColor: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - EvolutionChain
class EvolutionChain: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case url
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - FlavorTextEntry
class FlavorTextEntry: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var flavorText: String = ""
    @objc dynamic var language: PokemonColor?
    @objc dynamic var version: PokemonColor?
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case version
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - Genus
class Genus: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var genus: String = ""
    @objc dynamic var language: PokemonColor?
    
    enum CodingKeys: String, CodingKey {
        case genus
        case language
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - Name
class Name: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var language: PokemonColor?
    @objc dynamic var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case language
        case name
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - PalParkEncounter
class PalParkEncounter: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var area: PokemonColor?
    @objc dynamic var baseScore: Int = 0
    @objc dynamic var rate: Int
    
    enum CodingKeys: String, CodingKey {
        case area
        case baseScore = "base_score"
        case rate
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - PokedexNumber
class PokedexNumber: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var entryNumber: Int = 0
    @objc dynamic var pokedex: PokemonColor?
    
    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - Variety
class Variety: Object, Codable {
    @objc dynamic var localId = UUID().uuidString
    @objc dynamic var isDefault: Bool = false
    @objc dynamic var pokemon: PokemonColor?
    
    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}
