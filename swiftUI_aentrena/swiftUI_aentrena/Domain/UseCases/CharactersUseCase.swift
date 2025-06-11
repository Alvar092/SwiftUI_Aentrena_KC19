//
//  CharactersUseCase.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import Foundation

protocol CharactersUseCaseProtocol {
    var repoCharacters: CharactersRepository {get set}
    
    func getCharacters() async -> [CharacterResult]
}

// Real
final class CharactersUseCase: CharactersUseCaseProtocol {
    
    var repoCharacters: CharactersRepository
    
    init(repoCharacters: CharactersRepository = CharactersRepository(network: NetworkCharacters())) {
        self.repoCharacters = repoCharacters
    }
    
    func getCharacters() async -> [CharacterResult] {
        await repoCharacters.getCharactersMapped()
    }
}

// Mock
final class CharactersUseCaseMock: CharactersUseCaseProtocol {
    
    var repoCharacters: CharactersRepository
    
    init(repoCharacters: CharactersRepository = CharactersRepository(network: NetworkCharactersMock())) {
        self.repoCharacters = repoCharacters
    }
    
    func getCharacters() async -> [CharacterResult] {
        await repoCharacters.getCharactersMapped()
    }
}
