//
//  CharactersRepository.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import Foundation

final class CharactersRepository: CharactersRepositoryProtocol {
    
    private var network: NetworkCharactersProtocol
    
    init(network: NetworkCharactersProtocol) {
        self.network = network
    }
    
    func getCharactersMapped() async -> [CharacterResult] {
        guard let response = await network.getCharacters() else { return [] }
        
        let characters = response.data.results.map { result in
            CharacterResult(id: result.id,
                            name: result.name,
                            description: result.description,
                            thumbnail: result.thumbnail
            )
        }
        return characters
    }
    
    func getSeriesMapped(id: String) async -> [Series] {
        guard let response = await network.getSeries(id: id) else { return [] }
        
        let series = response.data.results.map{ result in
            Series(id: result.id,
                title: result.title,
                   description: result.description,
                   thumbnail: result.thumbnail
            )
        }
        return series
    }
}

final class CharactersRepositoryMock: CharactersRepositoryProtocol {
    
    private var network: NetworkCharactersProtocol
    
    init(network: NetworkCharactersProtocol = NetworkCharactersMock()) {
        self.network = network
    }
    
    func getCharactersMapped() async -> [CharacterResult] {
        guard let response = await network.getCharacters() else { return [] }
        
        let characters = response.data.results.map { result in
            CharacterResult(id: result.id,
                            name: result.name,
                            description: result.description,
                            thumbnail: result.thumbnail
            )
        }
        return characters
    }
    
    func getSeriesMapped(id: String) async -> [Series] {
        guard let response = await network.getSeries(id: id) else { return [] }
        
        let series = response.data.results.map{ result in
            Series(id: result.id,
                title: result.title,
                   description: result.description,
                   thumbnail: result.thumbnail
            )
        }
        return series 
    }
}
