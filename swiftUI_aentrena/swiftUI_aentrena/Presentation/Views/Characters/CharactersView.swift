//
//  CharactersView.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import SwiftUI

struct CharactersView: View {
    @Environment(AppStateVM.self) var appState
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
            .navigationTitle("Characters")
            .searchable(text: $viewModel.filterUI, prompt: "Search by name") // Esto tiene sentido si los primeros 20 son A?? 
            // TO DO: Implementar la dinámica de filtrar los heroes???
        } // NavStack
    }
}

#Preview {
    CharactersView(
        viewModel: CharactersViewModel(
            useCase: CharactersUseCaseMock()
        ))
        .environment(AppStateVM())
}
