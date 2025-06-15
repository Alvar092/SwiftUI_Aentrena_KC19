//
//  SeriesListView.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 12/6/25.
//

import SwiftUI

struct SerieRowView: View {
    
    var serie: Series
    
    var body: some View {
        ZStack{
            VStack{
                AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")) { photo in
                    photo
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .opacity(0.4)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                Text(serie.description ?? "")
                    .font(.callout)
                    .foregroundColor(.black)
                    .shadow(radius: 5)
                    .bold()
            }//VStack
            VStack{
                Spacer()
                Text(serie.title)
                    .font(.title2)
                    .foregroundStyle(.black)
                    .bold()
                    .padding()
                Spacer()
            }
        } //ZStack
        .padding()
    }
}

#Preview {
    SerieRowView(serie: Series(id: 2005,
        title: "Avengers: The Initiative (2007 - 2010)",
        description: "Wade Wilson: Heartless Merc With a Mouth or...hero? Laugh, cry and applaud at full volume for the mind-bending adventures of Deadpool, exploring the psyche and crazed adventures of Marvel's most unstable personality!" ,
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: Extension.jpg)))
}
