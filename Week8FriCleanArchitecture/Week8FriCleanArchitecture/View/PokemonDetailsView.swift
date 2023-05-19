//
//  PokemonDetailsView.swift
//  Week8FriCleanArchitecture
//
//  Created by Payam Karbassi on 19/05/2023.
//

import SwiftUI

struct PokemonDetailsView : View{
    var pokemon : PokemonEntity?
    
    var body: some View{
        Text(pokemon?.name ?? "No name receieved")
    }
    
}


struct PokemonDetailsView_previews : PreviewProvider{
    static var previews: some View{
        PokemonDetailsView()
    }
}
