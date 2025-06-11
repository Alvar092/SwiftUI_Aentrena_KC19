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
                            thumbnail: result.thumbnail,
                            series: result.series
            )
        }
        return characters
    }
    
    
    
}
