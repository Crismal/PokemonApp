//
//  EvolutionChartView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 26/5/23.
//

import SwiftUI

struct EvolutionChartView: View {
    var pokemonDetail: PokemonDetail
    @ObservedObject var viewModel: PokemonDetailViewModel
    
    var body: some View {
        VStack {
            Text("Evolution Chart")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.black)
            
            if let pokemonEvolution = viewModel.pokemonEvolution {
                Text(pokemonEvolution.chain.species.name )
                
                ForEach(pokemonEvolution.chain.evolutionDetails) { evolutionDetail in
                    Text(pokemonDetail.name)
                }
                
                ForEach(pokemonEvolution.chain.evolvesTo) { evolvesTo in
                    Text(evolvesTo.species.name)
                }
            }
        }
        .onAppear() {
            viewModel.getPokemonEvolution(pokemonId: pokemonDetail.id)
        }
    }
}

struct EvolutionView: View {
    let evolutionDetails: [EvolutionDetail]
    let evolvesTo: [ChainEvolvesTo]
    
    var body: some View {
        VStack {
            ForEach(evolutionDetails) { evolutionDetail in
                 
            }
            
            ForEach(evolvesTo) { evolvesTo in
                Text(evolvesTo.species.name)
            }
        }
    }
}
