//
//  SpritesView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 22/5/23.
//

import SwiftUI
import Kingfisher

struct SpritesView: View {
    var pokemonDetail: PokemonDetail
    
    var body: some View {
        VStack(spacing: 0) {
            Text(AppUtils.convertToPaddedString(number: pokemonDetail.id, padding: 3))
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color("Number"))
                .opacity(0.6)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(pokemonDetail.name.capitalized)
                .font(.system(size: 32))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 5) {
                ForEach(pokemonDetail.types) { type in
                    PokemonType(type: type)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
        }
        HStack {
            VStack {
                Text("Regular Sprite")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Color("Black"))
                    .frame(alignment: .center)
                KFImage(AppUtils.getURL(image: pokemonDetail.sprites.other.officialArtwork.frontDefault))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
            VStack {
                Text("Shiny Sprite")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Color("Black"))
                    .frame(alignment: .center)
                KFImage(AppUtils.getURL(image: pokemonDetail.sprites.other.officialArtwork.frontShiny))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
        }
    }
    
}

