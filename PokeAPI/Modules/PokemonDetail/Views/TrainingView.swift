//
//  TrainingView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 22/5/23.
//

import SwiftUI

struct TrainingView: View {
    var pokemonDetail: PokemonDetail
    var pokemonSpecie: PokemonSpecie?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Training")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(pokemonDetail.types.first!.type.name))
            HStack(spacing: 10) {
                Text("EV Yield")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .frame(maxWidth: 85, alignment: .leading)
                Text("TODO")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("Gray"))
            }
            
            if let pokemonSpecie = pokemonSpecie {
                HStack(spacing: 10) {
                    Text("Catch Rate")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .frame(maxWidth: 85, alignment: .leading)
                    Text("\(pokemonSpecie.captureRate)%")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("Gray"))
                }
            }
            if let pokemonSpecie = pokemonSpecie {
                HStack(spacing: 10) {
                    Text("Base Friendship")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .frame(maxWidth: 85, alignment: .leading)
                    Text("\(pokemonSpecie.baseHappiness)")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("Gray"))
                }
            }
            HStack(spacing: 10) {
                Text("Base Exp")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .frame(maxWidth: 85, alignment: .leading)
                Text("\(pokemonDetail.stats.first!.baseStat)")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("Gray"))
            }
            if let pokemonSpecie = pokemonSpecie {
                HStack(spacing: 10) {
                    Text("Growth Rate")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .frame(maxWidth: 85, alignment: .leading)
                    Text("\(pokemonSpecie.growthRate.name)")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("Gray"))
                }
            }
        }
    }
}
