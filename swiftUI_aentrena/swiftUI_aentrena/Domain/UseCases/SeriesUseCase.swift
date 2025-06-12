//
//  SeriesUseCase.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 12/6/25.
//

import Foundation

protocol SeriesUseCaseProtocol {
    func getSeries(id: String) async -> [Series]
}

final class SeriesUseCase: SeriesUseCaseProtocol {
    var repo: CharactersRepositoryProtocol
    
    init(repo: CharactersRepositoryProtocol = CharactersRepository(network: NetworkCharacters())) {
        self.repo = repo
    }
    
    func getSeries(id: String) async -> [Series] {
        await repo.getSeriesMapped(id: id)
    }
}

final class SeriesUseCaseMock: SeriesUseCaseProtocol {
    var repo: CharactersRepositoryProtocol
    
    init(repo: CharactersRepositoryProtocol = CharactersRepositoryMock()) {
        self.repo = repo
    }
    
    func getSeries(id: String) async -> [Series] {
        await repo.getSeriesMapped(id: id)
    }
}
