//
//  PokemonCell.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 18/5/23.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    var pokemonDetail: PokemonDetail
    var pokemonRegion: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(Color("back-\(pokemonDetail.types.first!.type.name)"))
                .frame(height: 115)
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(AppUtils.convertToPaddedString(number: pokemonDetail.id, padding: 3))
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Number"))
                            .opacity(0.6)
                        Text(pokemonRegion.capitalized)
                            .fontWeight(.bold)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    Text(pokemonDetail.name.capitalized)
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading], 20)
                
                KFImage(AppUtils.getURL(image: pokemonDetail.sprites.other.officialArtwork.frontDefault))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .padding(.bottom, 10)
            }
        }
    }
}
