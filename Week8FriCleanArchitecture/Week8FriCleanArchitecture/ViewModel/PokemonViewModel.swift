//
//  PokemonViewModel.swift
//  Week8FriCleanArchitecture
//
//  Created by Payam Karbassi on 19/05/2023.
//

import Foundation

enum ViewState{
    case loading, error, loaded, emptyView
}

protocol PokemonViewProtocol{
    func getListOfPokemons(urlString:String) async
}

@MainActor
final class PokemonViewModel {
    @Published var pokemonList : [PokemonEntity] = []
    @Published var networkError : NetworkErrorEnum?
    @Published private(set) var viewState : ViewState = .loaded
    
    let repository:PokemonRepositoryProtocol
    init(anyRepository:PokemonRepositoryProtocol){
        self.repository = anyRepository
    }
}

extension PokemonViewModel : ObservableObject, PokemonViewProtocol{
    func getListOfPokemons(urlString:String) async{
        guard let url = URL(string: urlString) else {networkError = .invalidUrl;return}
        do {

            let pokemonData = try await self.repository.getPokemonList(url: url)
            self.pokemonList = pokemonData.results
            viewState = pokemonList.isEmpty ? .emptyView : .loaded
            return
            
        } catch NetworkErrorEnum.invalidUrl {
            networkError = .invalidUrl
        }catch NetworkErrorEnum.dataNotFoundError{
            networkError = .dataNotFoundError
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }

        viewState = .error
    }
}
