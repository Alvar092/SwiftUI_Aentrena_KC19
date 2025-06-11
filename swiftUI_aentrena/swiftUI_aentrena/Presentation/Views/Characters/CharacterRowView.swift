//
//  CharacterRowView.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import SwiftUI

struct CharacterRowView: View {
    var character: CharacterResult
    
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
                // Recibimos
                photo
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .opacity(0.8)
            } placeholder: {
                ProgressView()
            }
            
            // Datos
            VStack{
                HStack{
                    Text(character.name)
                        .font(.title)
                        .bold()
                        .padding(.leading, 10)
                    Spacer()
                } // HStack
                Spacer()
            }// VStack
        } // ZStack
    }
}

#Preview {
    CharacterRowView(character: CharacterResult(
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
            returned: 3)))
}
