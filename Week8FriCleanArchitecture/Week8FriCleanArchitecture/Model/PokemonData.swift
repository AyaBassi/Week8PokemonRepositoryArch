//
//  PokemonData.swift
//  Week8FriCleanArchitecture
//
//  Created by Payam Karbassi on 19/05/2023.
//

import Foundation

struct PokemonData :Decodable {
    let count : Int
    let next:String
    let previous: String?
    let results:[PokemonEntity]
}

struct PokemonEntity : Decodable {
    let name : String
    let url:String
}

extension PokemonEntity: Identifiable {
    var id : UUID {
        UUID()
    }
}
