//
//  CharactersViewModel.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import Foundation
import Combine

@Observable
final class CharactersViewModel {
    // Publicadores
    var characters = [CharacterResult]()
    var filterUI: String = ""
    
    @ObservationIgnored
    private var useCase: CharactersUseCaseProtocol
    
    init(useCase: CharactersUseCaseProtocol = CharactersUseCase()) {
        self.useCase = useCase
        
        Task{
            await self.getCharacters()
        }
        
    }
    
    
    @MainActor
    func getCharacters() async {
        let data  = await useCase.getCharacters()
        self.characters = data
    }
    
    
}
