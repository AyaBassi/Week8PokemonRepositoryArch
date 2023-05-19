//
//  ContentView.swift
//  Week8FriCleanArchitecture
//
//  Created by Payam Karbassi on 19/05/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var pokemonViewModel = PokemonViewModel(
        anyRepository: PokemonRepository(
            anyNetworkManager:NetworkManager())
    )
    
    var body: some View {
        NavigationStack{
            VStack{
                switch pokemonViewModel.viewState {
                case .loading:  showUILoadingView()
                case .loaded:   showPokemonList()
                case .error:    showErrorMessage()
                case .emptyView:EmptyView()
                }
                
            }.task {
                await callingForPokemonApi()
                
            }.refreshable {
                await callingForPokemonApi()
            }
            .navigationTitle("Pokemon")
        }
    }
    
    
    func callingForPokemonApi() async{
        await pokemonViewModel.getListOfPokemons(urlString: APIEndPoint.pokemonListEndPoint)
    }
    
    @ViewBuilder
    func showUILoadingView() -> some View{
        ProgressView()
    }
    @ViewBuilder
    func showErrorMessage() -> some View{
        Text("Opps something went wrong").font(.subheadline).padding()
        Text(pokemonViewModel.networkError?.errorDescription ?? "Did not get error").font(.caption)
    }
    
    @ViewBuilder
    func showPokemonList()->some View {
        List(pokemonViewModel.pokemonList){pokemon in
            NavigationLink {
                PokemonDetailsView(pokemon: pokemon)
            } label: {
                Text("\(pokemon.name)")
            }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
