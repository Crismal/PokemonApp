//
//  PokemonDetail.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 18/5/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @State var showAbout = true
    @State var showStats = false
    @State var showEvolution = false
    var pokemonDetail: PokemonDetail
    var pokemonSpecie: PokemonSpecie?
    @ObservedObject var viewModel = PokemonDetailViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    SpritesView(pokemonDetail: pokemonDetail)
                        .padding(.horizontal, 40)
                        .padding([.top, .bottom], 10)
                        .frame(maxWidth: .infinity)
                    HStack {
                        Button {
                            self.showView(showAbout: true, showStats: false, showEvolution: false)
                        } label: {
                            ZStack {
                                if showAbout {
                                    Image("PokeballMenu")
                                        .frame(width: 100, height: 100, alignment: .center)
                                }
                                
                                Text("About")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(showAbout ? 1 : 0.5)
                                    .padding(.bottom, 30)
                            }
                            .frame(width: 100, height: 100, alignment: .center)
                        }
                        Spacer()
                        Button {
                            self.showView(showAbout: false, showStats: true, showEvolution: false)
                        } label: {
                            ZStack {
                                if showStats {
                                    Image("PokeballMenu")
                                        .frame(width: 100, height: 100, alignment: .center)
                                }
                                Text("Stats")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(showStats ? 1 : 0.5)
                                    .padding(.bottom, 30)
                            }
                            .frame(width: 100, height: 100, alignment: .center)
                        }
                        Spacer()
                        Button {
                            self.showView(showAbout: false, showStats: false, showEvolution: true)
                        } label: {
                            ZStack {
                                if showEvolution {
                                    Image("PokeballMenu")
                                        .frame(width: 100, height: 100, alignment: .center)
                                }
                                Text("Evolution")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(showEvolution ? 1 : 0.5)
                                    .padding(.bottom, 30)
                            }
                            .frame(width: 100, height: 100, alignment: .center)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding([.horizontal], 20)
                    VStack {
                        if showAbout {
                            VStack(spacing: 20) {
                                PokedexDataView(pokemonDetail: pokemonDetail, pokemonSpecie: pokemonSpecie)
                                TrainingView(pokemonDetail: pokemonDetail, pokemonSpecie: pokemonSpecie)
                            }
                            .padding([.top, .bottom, .horizontal], 40)
                            .background(Color.white)
                            .frame(maxWidth: .infinity)
                            .mask(TopRoundedRectangle(radius: 40))
                        }
                        
                        if showStats {
                            VStack(spacing: 20) {
                                BaseStatsView(pokemonDetail: pokemonDetail)
                            }
                            .padding([.top, .bottom, .horizontal], 40)
                            .background(Color.white)
                            .frame(maxWidth: .infinity)
                            .mask(TopRoundedRectangle(radius: 40))
                        }
                        
                        if showEvolution {
                            VStack(spacing: 20) {
                                EvolutionChartView(pokemonDetail: pokemonDetail, viewModel: viewModel)
                            }
                            .padding([.top, .bottom, .horizontal], 40)
                            .background(Color.white)
                            .frame(maxWidth: .infinity)
                            .mask(TopRoundedRectangle(radius: 40))
                        }
                    }
                    .padding(.top, -70)
                }
                .padding(.top, 70)
                .background(Color("back-\(pokemonDetail.types.first!.type?.name ?? "")"))
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image("Back")
                    .foregroundColor(.white)
            }
            .frame(width: 25, height: 25, alignment: .center)
            .padding([.top, .leading], 40)
        }
        .navigationBarBackButtonHidden()
        .edgesIgnoringSafeArea(.top)
    }
}
 
