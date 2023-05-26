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
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(Color("back-\(pokemonDetail.types.first!.type?.name ?? "")"))
                .frame(height: 115)
            Image("Pattern")
                .resizable()
                .frame(width: 74, height: 32, alignment: .topLeading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading], 90)
                .padding([.bottom], 78)
            Image("Pokeball")
                .resizable()
                .frame(width: 115, height: 115, alignment: .topLeading)
                .frame(maxWidth: .infinity, alignment: .trailing)
            HStack(alignment: .center) {
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
                VStack() {
                    KFImage(AppUtils.getURL(image: pokemonDetail.sprites?.other?.officialArtwork?.frontDefault ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                }
                .padding([.trailing], 10)
                .padding([.bottom], 15)
                .frame(width: 130, height: 130)
            }
        }
        .frame(height: 130)
        .padding([.top, .bottom], 20)
    }
}
