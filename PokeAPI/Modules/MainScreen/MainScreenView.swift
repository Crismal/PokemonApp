//
//  MainScreenView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject var viewModel = MainScreenViewModel()
    @ObservedObject var sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack(spacing: 24) {
                    Text("Pokédex")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: SettingsView(sessionManager: sessionManager)) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                .foregroundColor(.black)
                .padding([.trailing, .top, .leading], 40)
                GeometryReader { geometry in
                    List(viewModel.pokemonDetail) { item in
                        PokemonCell(pokemonDetail: item, pokemonRegion: viewModel.getPokemonRegion(pokemonId: item.id))
                            .background(
                                NavigationLink(destination: PokemonDetailView(pokemonDetail: item, pokemonSpecie: viewModel.getPokemonSpecie(pokemonId: item.id))) {
                                    PokemonCell(pokemonDetail: item, pokemonRegion: viewModel.getPokemonRegion(pokemonId: item.id))
                                }
                                    .opacity(0)
                            )
                            .frame(width: geometry.size.width - 40, alignment: .leading)
                            .padding(.leading, 0)
                            .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    .background(Color.yellow)
                    .onAppear() {
                        UITableView.appearance().separatorStyle = .none
                        UITableView.appearance().backgroundColor = UIColor.clear
                        UITableViewCell.appearance().backgroundColor = UIColor.clear
                    }
                }
            }
        }
        .onAppear {
            viewModel.getPokemons()
        }
    }
    
}
