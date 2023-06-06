//
//  Pokemon.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 16/5/23.
//

import Foundation
import RealmSwift

class PokemonResult: Codable {
    var id = UUID().uuidString
    var count: Int = 0
    var next: String? = ""
    var pokemons = [Pokemon]()
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case pokemons = "results"
    }
}

class Pokemon: Object, Codable, Identifiable {
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }
    
    func getComputedId() -> Int? {
        guard let numberString = url.split(separator: "/").last else {
            return nil
        }
        
        return Int(numberString)
    }
    
}
