//
//  PokemonDetail.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 18/5/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    var pokemonDetail: PokemonDetail
    var pokemonSpecie: PokemonSpecie?
    
    let imageURL = URL(string: "https://example.com/image.jpg")!
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SpritesView(pokemonDetail: pokemonDetail)
                    .padding(.horizontal, 40)
                    .padding([.top, .bottom], 10)
                    .frame(maxWidth: .infinity)
                VStack(spacing: 20) {
                    PokedexDataView(pokemonDetail: pokemonDetail, pokemonSpecie: pokemonSpecie)
                    TrainingView(pokemonDetail: pokemonDetail, pokemonSpecie: pokemonSpecie)
                }
                .padding([.top, .bottom, .horizontal], 40)
                .background(Color.white)
                .frame(maxWidth: .infinity)
                .mask(TopRoundedRectangle(radius: 40))
            }
            .background(Color("back-\(pokemonDetail.types.first!.type?.name ?? "")"))
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
 
