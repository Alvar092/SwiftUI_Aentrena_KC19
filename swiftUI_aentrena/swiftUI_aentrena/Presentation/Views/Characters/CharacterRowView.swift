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
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg)))
}
