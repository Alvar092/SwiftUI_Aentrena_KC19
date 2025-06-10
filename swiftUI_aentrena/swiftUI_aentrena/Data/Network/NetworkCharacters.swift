//
//  NetworkHeros.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 10/6/25.
//

import Foundation

protocol NetworkCharactersProtocol {
    func getCharacters() async -> [CharacterResult]
}

final class NetworkCharacters: NetworkCharactersProtocol {
    func getCharacters() async -> [CharacterResult] {
        var modelReturn = [CharacterResult]()
        
        let urlCad: String = "\(ConstantsApp.CONST_API_URL)\(Endpoints.characters.rawValue)?ts=\(ConstantsApp.TS)&apikey=\(ConstantsApp.PUBLIC_KEY)&hash=\(ConstantsApp.HASH)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        
        //Call to server
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCESS {
                    //Decodifico
                    let wrapper = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    modelReturn = wrapper.data.results
                }
            }
        } catch{
            //Error...
            NSLog("Error calling characters")
        }
        return modelReturn
    }
}



final class NetworkCharactersMock: NetworkCharactersProtocol {
    func getCharacters() async -> [CharacterResult] {
        let model1 = CharacterResult(
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
                returned: 3))
        
        return [model1]
    }
}
