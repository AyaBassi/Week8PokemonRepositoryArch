//
//  PokemonRepository.swift
//  Week8FriCleanArchitecture
//
//  Created by Payam Karbassi on 19/05/2023.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func getPokemonList (url:URL)  async throws -> PokemonData
}
class PokemonRepository {
    
    let networkManager:NetworkableProtocol
    init(anyNetworkManager:NetworkableProtocol){
        self.networkManager = anyNetworkManager
    }
    
}

extension PokemonRepository : PokemonRepositoryProtocol{
    func getPokemonList(url: URL) async throws -> PokemonData {
        let data = try await self.networkManager.getData(url: url)
        let pokemonData = try JSONDecoder().decode(PokemonData.self, from: data) 
        return pokemonData
    }
}
