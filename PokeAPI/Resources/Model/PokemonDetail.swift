//
//  PokemonDetail.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 18/5/23.
//

import Foundation
import RealmSwift

// MARK: - PokemonDetail
class PokemonDetail: Object, Codable, Identifiable {
    @objc dynamic var localId = UUID().uuidString
    var abilities = List<Ability>()
    @objc dynamic var baseExperience: Int = 0
    var forms = List<Species>()
    var gameIndices = List<GameIndices>()
    @objc dynamic var height: Int = 0
    var heldItems = List<HeldItem>()
    @objc dynamic var id: Int = 0
    @objc dynamic var isDefault: Bool = false
    @objc dynamic var locationAreaEncounters: String = ""
    var moves = List<Move>()
    @objc dynamic var name: String = ""
    @objc dynamic var order: Int = 0
    @objc dynamic var species: Species?
    @objc dynamic var sprites: Sprites?
    var stats = List<Stat>()
    var types = List<TypeElement>()
    @objc dynamic var weight: Int = 0

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves
        case name
        case order
        case species
        case sprites
        case stats
        case types
        case weight
    }
    
    override class func primaryKey() -> String? {
        return "localId"
    }
    
}

// MARK: - HeldItem
class HeldItem: Object, Codable {
    @objc dynamic var item: Species?
    var versionDetails = List<VersionDetail>()

    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}

// MARK: - VersionDetail
class VersionDetail: Object, Codable {
    @objc dynamic var rarity: Int = 0
    @objc dynamic var version: Species?

    enum CodingKeys: String, CodingKey {
        case rarity
        case version
    }
}

// MARK: - Ability
class Ability: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var ability: Species?
    @objc dynamic var isHidden: Bool = false
    @objc dynamic var slot: Int = 0

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}

// MARK: - Species
class Species: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - GameIndex
class GameIndices: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var gameIndex: Int = 0
    @objc dynamic var version: Species?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Move
class Move: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var move: Species?
    var versionGroupDetails = List<VersionGroupDetail>()

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - VersionGroupDetail
class VersionGroupDetail: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var levelLearnedAt: Int = 0
    @objc dynamic var moveLearnMethod: Species?
    @objc dynamic var versionGroup: Species?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Sprites
class Sprites: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var backDefault: String? = ""
    @objc dynamic var backFemale: String? = ""
    @objc dynamic var backShiny: String? = ""
    @objc dynamic var backShinyFemale: String? = ""
    @objc dynamic var frontDefault: String? = ""
    @objc dynamic var frontFemale: String? = ""
    @objc dynamic var frontShiny: String? = ""
    @objc dynamic var frontShinyFemale: String? = ""
    @objc dynamic var other: Other?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Other
class Other: Object, Codable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var dreamWorld: DreamWorld?
    @objc dynamic var officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - DreamWorld
class DreamWorld: Object, Codable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var frontDefault: String? = ""
    @objc dynamic var frontFemale: String? = ""

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - OfficialArtwork
class OfficialArtwork: Object, Codable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var frontDefault: String? = ""
    @objc dynamic var frontShiny: String? = ""

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Stat
class Stat: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var baseStat: Int = 0
    @objc dynamic var effort: Int = 0
    @objc dynamic var stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - TypeElement
class TypeElement: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var slot: Int = 0
    @objc dynamic var type: Species?

    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
