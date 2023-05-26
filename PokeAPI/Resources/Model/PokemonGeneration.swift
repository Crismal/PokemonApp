//
//  PokemonGeneration.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 24/5/23.
//

import Foundation
import RealmSwift

// MARK: - PokemonGeneration
class PokemonGeneration: Object, Codable {
    @objc dynamic var localId: String = UUID().uuidString
    var abilities = List<PokemonColor>()
    @objc dynamic var id: Int = 0
    @objc dynamic var mainRegion: PokemonColor?
    var moves = List<PokemonColor>()
    @objc dynamic var name: String = ""
    var names = List<GenerationName>()
    var pokemonSpecies = List<PokemonColor>()
    var types = List<PokemonColor>()
    var versionGroups = List<PokemonColor>()

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
    
    override class func primaryKey() -> String? {
        return "localId"
    }
}

// MARK: - Name
class GenerationName: Object, Codable {
    @objc dynamic var localId: String = UUID().uuidString
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
