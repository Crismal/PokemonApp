//
//  CurrentUser.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import Foundation

struct CurrentUser: Codable {
    let createdAt: String
    let email: String
    let password: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case createdAt
        case email
        case password
        case id
    }
}
typealias CurrenUsers = [CurrentUser]
