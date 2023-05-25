//
//  PokedexData.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 22/5/23.
//

import SwiftUI

struct PokedexDataView: View {
    
    var pokemonDetail: PokemonDetail
    var pokemonSpecie: PokemonSpecie?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Pokédex data")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(pokemonDetail.types.first!.type?.name ?? ""))
            if let pokemonSpecie = pokemonSpecie {
                HStack(spacing: 10) {
                    Text("Species")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .frame(maxWidth: 85, alignment: .leading)
                        .foregroundColor(Color("Black"))
                    Text(pokemonSpecie.genera[7].genus)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("Gray"))
                }
            }
           
            HStack(spacing: 10) {
                Text("Height")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .frame(maxWidth: 85, alignment: .leading)
                Text("\(pokemonDetail.height)")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("Gray"))
            }
            HStack(spacing: 10) {
                Text("Weight")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .frame(maxWidth: 85, alignment: .leading)
                Text("\(pokemonDetail.weight)")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("Gray"))
            }
            HStack(spacing: 10) {
                Text("Abilities")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .frame(maxWidth: 85, alignment: .leading)
                ForEach(pokemonDetail.abilities) { ability in
                    Text(ability.ability?.name ?? "")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("Gray"))
                }
            }
            HStack(spacing: 10) {
                Text("Weaknesses")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .frame(maxWidth: 85, alignment: .leading)
                Text("TODO")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("Gray"))
            }
        }
    }
}
