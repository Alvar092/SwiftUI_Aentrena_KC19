//
//  CharacterDetailView.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: CharacterResult
    
    @Bindable var vmChars: CharactersViewModel
    
    
    
    var body: some View {
        // 
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CharacterDetailView(character: CharacterResult(
        id: 1011334,
        name: "3-D Man",
        description: "",
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg),
        series: Series(
            available: 3,
            collectionURL: "https://gateway.marvel.com/v1/public/characters/1011334/series",
            items:[
                SerieItem(resourceURI: "https://gateway.marvel.com/v1/public/series/1945", name: "Avengers: The Initiative (2007 - 2010)"),
                SerieItem(resourceURI: "https://gateway.marvel.com/v1/public/series/2005", name: "Deadpool (1997 - 2002)"),
                SerieItem(resourceURI: "https://gateway.marvel.com/v1/public/series/2045", name: "Marvel Premiere (1972 - 1981)")],
            returned: 3)),
                        vmChars: CharactersViewModel(useCase: CharactersUseCaseMock()))
}
