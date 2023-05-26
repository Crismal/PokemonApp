//
//  Pokemon.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 16/5/23.
//

import Foundation
import RealmSwift

// MARK: - Welcome
class PokemonResult: Object, Codable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var count: Int = 0
    @objc dynamic var next: String = ""
    var pokemons = List<Pokemon>()
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case pokemons = "results"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}

// MARK: - Result
class Pokemon: Object, Codable, Identifiable {
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
    
    func getComputedId() -> Int? {
        guard let numberString = url.split(separator: "/").last else {
            return nil
        }
        
        return Int(numberString)
    }
}
