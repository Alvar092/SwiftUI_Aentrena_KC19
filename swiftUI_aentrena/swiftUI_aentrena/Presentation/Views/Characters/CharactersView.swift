//
//  CharactersView.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import SwiftUI

struct CharactersView: View {

    @State var viewModel: CharactersViewModel
    
    //Solo para la transicion al detalle
    @Namespace
    private var nameSpace
    
    init(viewModel: CharactersViewModel = CharactersViewModel()){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.characters) { character in
                    NavigationLink{
                        // Destination (hacer tap para desplegar el detalle)
                        CharacterDetailView(character: character, vmSeries: CharactersDetailViewModel(character: character))
                            .navigationTransition(.zoom(sourceID: character.id, in: nameSpace ))
                    } label: {
                        // Row del personaje
                        CharacterRowView(character: character)
                            .frame(height: 200)
                    }
                }
            }
            .id(0)
            .navigationTitle("Characters")
        } // NavStack
    }
}

#Preview {
    CharactersView(
        viewModel: CharactersViewModel(
            useCase: CharactersUseCaseMock()
        ))
}
