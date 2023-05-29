//
//  EvolutionChartView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 26/5/23.
//

import SwiftUI

struct EvolutionChartView: View {
    var body: some View {
        VStack {
            Text("Evolution Chart")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.black)
            
        }
    }
}

struct EvolutionChartView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionChartView()
    }
}
