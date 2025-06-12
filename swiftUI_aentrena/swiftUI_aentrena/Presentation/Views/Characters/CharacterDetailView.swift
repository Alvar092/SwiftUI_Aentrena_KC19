//
//  CharacterDetailView.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: CharacterResult
    
    @Bindable var vmSeries: CharactersDetailViewModel
    
    
    
    var body: some View {
        
        // Lista de series
        NavigationStack{
            List {
                ForEach(vmSeries.series) { serie in
                    SerieRowView(serie: serie)
                }
                .frame(height: 200)
            }
        }
        
        
    }
}

#Preview {
    CharacterDetailView(character: CharacterResult(
        id: 1011334,
        name: "3-D Man",
        description: "",
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg)), vmSeries: CharactersDetailViewModel(character: CharacterResult(
            id: 1011334,
            name: "3-D Man",
            description: "",
            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg)), useCase:SeriesUseCaseMock()))
        .environment(AppStateVM())
}
