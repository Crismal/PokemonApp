//
//  AppUtils.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 23/5/23.
//

import Foundation

struct AppUtils {
    
    static func getURL(image: String) -> URL {
        return URL(string: image)!
    }
    
    static func convertToPaddedString(number: Int, padding: Int) -> String {
        return String(format: "#%0\(padding)d", number)
    }
}
