//
//  NetworkHeros.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 10/6/25.
//

import Foundation

protocol NetworkCharactersProtocol {
    func getCharacters() async -> [CharactersModel]
}

final class NetworkCharacters: NetworkCharactersProtocol {
    func getCharacters() async -> [CharactersModel] {
        var modelReturn = [CharactersModel]()
        
        let urlCad: String = "\(ConstantsApp.CONST_API_URL)\(Endpoints.characters.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        request.addValue(HttpMethods.content, forHTTPHeaderField: "Content-type")
        
        //Call to server
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCESS {
                    //Decodifico
                    modelReturn = try JSONDecoder().decode([CharactersModel].self, from: data)
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
    func getCharacters() async -> [CharactersModel] {
        let model1 = CharactersModel(id: UUID(),
                                     name: "3-D Man",
                                     description: "",
                                     modified: "2014-04-29T14:18:17+0000",
                                     thumbnail: Image(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"),
                                     resourceURL: "https://gateway.marvel.com/v1/public/characters/1011334",
                                     series: SeriesList(available: 3, collectionURL: "https://gateway.marvel.com/v1/public/characters/1011334/series", items: [SeriesSummary(resourceURL: "https://gateway.marvel.com/v1/public/series/1945", name: "Avengers: The Initiative (2007 - 2010)"), SeriesSummary(resourceURL: "https://gateway.marvel.com/v1/public/series/2005", name: "Deadpool (1997 - 2002)"), SeriesSummary(resourceURL: "https://gateway.marvel.com/v1/public/series/2045", name: "Marvel Premiere (1972 - 1981)")], returned: 3))
        
        return [model1]
    }
}
