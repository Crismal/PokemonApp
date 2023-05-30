//
//  MainScreenView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import SwiftUI
import Kingfisher

struct MainScreenView: View {
    
    @ObservedObject var viewModel = MainScreenViewModel()
    @ObservedObject var sessionManager: SessionManager
    @State var searchText: String = ""
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    var body: some View {
        
        NavigationView {
            if viewModel.isLoading {
                VStack {
                    Image("loading")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Loading...")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color.white)
            } else {
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
                    
                    Text("Search for Pokémon by name or using the National Pokédex number.")
                        .foregroundColor(Color("Gray"))
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding([.horizontal], 40)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        .padding(.leading, 10)
                        TextField("What Pokémon are you looking for?", text: $searchText) { editing in
                            viewModel.seachPokemon(searchText: searchText)
                        }
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .font(.system(size: 16))
                    }
                    .frame(height: 60)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding([.horizontal], 40)
                    .padding([.top], 25)
                    .padding([.bottom], 20)
                    
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
                                .onAppear {
                                    viewModel.loadMoreData(currentPokemon: item)
                                }
                        }
                        .listStyle(GroupedListStyle())
                        .environment(\.horizontalSizeClass, .regular)
                    }
                }
            }
            
        }
        .onAppear {
            viewModel.getPokemons()
        }
       
    }
}
