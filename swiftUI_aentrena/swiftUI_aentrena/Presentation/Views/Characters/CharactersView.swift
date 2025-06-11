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
    
    init(viewModel: CharactersViewModel = CharactersViewModel()){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.characters) { character in
                    NavigationLink{
                        // Destination (hacer tap para desplegar el detalle)
                        
                        
                    } label: {
                        // Row del personaje
                        CharacterRowView(character: character)
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
    CharactersView(viewModel: CharactersViewModel(useCase: CharactersUseCaseMock()))
        .environment(AppStateVM())
}
