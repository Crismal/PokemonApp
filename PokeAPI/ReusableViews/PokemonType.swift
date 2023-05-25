//
//  PokemonType.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 22/5/23.
//

import SwiftUI

struct PokemonType: View {
    let type: TypeElement
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(type.type?.name ?? "")
                .resizable()
                .foregroundColor(Color.white)
                .frame(width: 15, height: 15)
            Text("\(type.type?.name.capitalized ?? "")" )
                .font(.system(size: 12))
                .fontWeight(.medium)
                .frame(alignment: .center)
                .foregroundColor(.white)
        }
        .padding()
        .frame(height: 25)
        .background(RoundedRectangle(cornerRadius: 3).fill(Color(type.type?.name ?? "")))
    }
}
