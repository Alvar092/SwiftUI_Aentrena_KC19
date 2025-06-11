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
        // Nombre del heroe y detalle
        VStack{
            VStack{
                Text(character.name)
                    .font(.title2)
                    .bold()
                Text(character.description)
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .padding([.leading, .trailing], 10)
            } // VStack
            AsyncImage(url: URL(string:"\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { foto in
                foto
                    
                // TO DO: APAÑAR LA FOTO 
            }
        } // HStack
    }
}

#Preview {
    CharacterDetailView(character: CharacterResult(
        id: 1011334,
        name: "3-D Man",
        description: "Aunque sus aventuras tienen lugar en la década de 1950, el personaje fue creado por Roy Thomas en la década de 1970 en la serie antológica Marvel Premiere. El personaje era un homenaje del escritor Thomas a un personaje de Joe Simon y Jack Kirby, el Capitán 3-D, y pretendía ser para Thomas un comentario sobre temas sociales contemporáneos utilizando análogos de la década de 1950.\nEl personaje también apareció en The Incredible Hulk #251-252, Contest of Champions, y What If (vol. 1) #9. 3-D Man no volvió a aparecer por muchos años, hasta que fue reintroducido en Avengers Forever #4 y apareció en Avengers #50-55 y el one-shot Secret Invasion: Skrulls de 2008.",
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
