//
//  NetworkHeros.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 10/6/25.
//

import Foundation

protocol NetworkCharactersProtocol {
    func getCharacters() async -> CharactersResponse?
    func getSeries(id: String) async -> SeriesResponse?
}

final class NetworkCharacters: NetworkCharactersProtocol {
    func getCharacters() async -> CharactersResponse? {
        var modelReturn: CharactersResponse? = nil
        
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
                    modelReturn = wrapper
                }
            }
        } catch{
            //Error...
            NSLog("Error calling characters")
        }
        return modelReturn
    }
    
    
    func getSeries(id: String) async -> SeriesResponse? {
        var modelReturn: SeriesResponse? = nil
        
        let urlCad: String = "\(ConstantsApp.CONST_API_URL)\(Endpoints.characters.rawValue)/\(id)/series?ts=\(ConstantsApp.TS)&apikey=\(ConstantsApp.PUBLIC_KEY)&hash=\(ConstantsApp.HASH)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        
        //Call to server
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCESS {
                    //Decodifico
                    modelReturn = try JSONDecoder().decode(SeriesResponse.self, from: data)

                    
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
    func getCharacters() async -> CharactersResponse? {
        let response = CharactersResponse(
            data: CharactersData(
                results:[CharacterResult(
                    id: 1011334,
                    name: "3-D Man",
                    description: "",
                    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg)),
                         CharacterResult(
                            id: 1017100,
                            name: "A-Bomb (HAS)",
                            description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
                            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg))]))
        
        //        let model2 = CharactersResponse(
        //            data: CharactersData(
        //                results: [CharacterResult(id: 1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg), series: Series(available: 2, collectionURL: "https://gateway.marvel.com/v1/public/characters/1017100/series", items: [SerieItem(resourceURI: "https://gateway.marvel.com/v1/public/series/17765", name: "FREE COMIC BOOK DAY 2013 1 (2013)"), SerieItem(resourceURI: "https://gateway.marvel.com/v1/public/series/3374", name: "Hulk (2008 - 2012)")], returned: 2))]))
        
        return response
    }
    
    func getSeries(id: String) async -> SeriesResponse? {
        let response = SeriesResponse(
            data: SeriesData(
                results: [Series(
                    id: 1945,
                    title: "Avengers: The Initiative (2007 - 2010)",
                    description: nil ,
                    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: Extension.jpg)),
                          Series(id: 2005,
                            title: "Deadpool (1997 - 2002)",
                            description: "Wade Wilson: Heartless Merc With a Mouth or...hero? Laugh, cry and applaud at full volume for the mind-bending adventures of Deadpool, exploring the psyche and crazed adventures of Marvel's most unstable personality!",
                            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/7/03/5130f646465e3", thumbnailExtension: Extension.jpg)),
                          Series(id: 2045, 
                            title: "Marvel Premiere (1972 - 1981)",
                            description: nil,
                            thumbnail: Thumbnail(
                                path: "http://i.annihil.us/u/prod/marvel/i/mg/4/40/5a98437953d4e",
                                thumbnailExtension: Extension.jpg))]))
        
        return response
    }
}
