//
//  BaseStatsView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 26/5/23.
//

import SwiftUI

struct BaseStatsView: View {
    var pokemonDetail: PokemonDetail
    var body: some View {
        VStack(spacing: 22.5) {
            Text("Base Stats")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(pokemonDetail.types.first!.type?.name ?? ""))
            VStack(spacing: 20) {
                ForEach(pokemonDetail.stats) {stat in
                    HStack(spacing: 10) {
                        Text(getStatName(nameStat: stat.stat?.name ?? ""))
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .frame(width: 48, alignment: .leading)
                        Text("\(stat.baseStat)")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .frame(width: 30, alignment: .leading)
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 2)
                                .frame(width: calculatewidth(stat: stat), height: 4)
                                .foregroundColor(Color(pokemonDetail.types.first!.type?.name ?? ""))
                        }
                        Spacer()
                        Text("\(calculateMinValue(name: stat.stat?.name ?? "", base: stat.baseStat))")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .frame(width: 30, alignment: .leading)
                        Text("\(calculateMaxValue(name: stat.stat?.name ?? "", base: stat.baseStat))")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .frame(width: 30, alignment: .leading)
                    }
                }
            }
            
        }
    }
    
    func getStatName(nameStat: String?) -> String {
        switch nameStat {
        case "hp":
            return "HP"
        case "attack":
            return "Attack"
        case "defense":
            return "Defense"
        case "special-attack":
            return "Sp. Atk"
        case "special-defense":
            return "Sp. Def"
        case "speed":
            return "Speed"
        default:
            return ""
        }
    }
    
    func calculateMinValue(name: String, base: Int) -> Int {
        if "hp" == name {
            return (2 * base + 110)
        } else {
            return Int(Double(2 * base + 5) * 0.9)
        }
    }
    
    func calculateMaxValue(name: String, base: Int) -> Int {
        if "hp" == name {
            return (2 * base + 204)
        } else {
            return Int(Double(2 * base + 99) * 1.1)
        }
    }
    
    func calculatewidth(stat: Stat) -> CGFloat {
        let width = CGFloat(stat.baseStat) / CGFloat(calculateMaxValue(name: stat.stat?.name ?? "", base: stat.baseStat))
        return width * 200
    }
}
