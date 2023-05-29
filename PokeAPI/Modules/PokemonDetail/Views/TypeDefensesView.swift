//
//  TypeDefensesView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 26/5/23.
//

import SwiftUI

struct TypeDefensesView: View {
    var body: some View {
        VStack {
            Text("Type Defences")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.black)
             
        }
    }
}

struct TypeDefensesView_Previews: PreviewProvider {
    static var previews: some View {
        TypeDefensesView()
    }
}
