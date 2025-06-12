//
//  CharactersDetailViewModel.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 12/6/25.
//

import Foundation
import Combine

@Observable
final class CharactersDetailViewModel {
    // Publicadores
    var character: CharacterResult
    var series = [Series]()
    
    @ObservationIgnored
    var useCase: SeriesUseCaseProtocol
    
    init(character: CharacterResult ,useCase: SeriesUseCaseProtocol = SeriesUseCase()) {
        self.character = character
        self.useCase = useCase
        
        
        Task {
           await self.getSeries(id: (character.id))
        }
    }
   
    @MainActor
    func getSeries(id: Int) async {
       let data = await useCase.getSeries(id: "\(id)")
        self.series = data
        
    }
    
    
}
