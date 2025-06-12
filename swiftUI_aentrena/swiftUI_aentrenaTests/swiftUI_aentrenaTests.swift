//
//  swiftUI_aentrenaTests.swift
//  swiftUI_aentrenaTests
//
//  Created by Álvaro Entrena Casas on 2/6/25.
//

import Testing
@testable import swiftUI_aentrena
import Foundation
import Combine

struct swiftUI_aentrenaTests {
    @Suite("Data Testing") struct DataTests {
        @Suite("Network", .serialized) struct NetworkTest{
            @Test("NetworkCharacters")
            func getCharactersTest() async throws {
                // GIVEN
                let network = NetworkCharacters()
                
                // WHEN
                let response = await network.getCharacters()
                
                // THEN
                #expect(response != nil, "La respuesta no puede ser nil")
                
                guard let characters = response?.data.results else {
                    #expect(Bool(false), "no se pudieron obtener los personajes")
                    return
                }
                
                #expect(!characters.isEmpty, "La respuesta no puede estar vacia")
                #expect(characters.first?.id != nil, "El primer personaje debe tener un id válido")
                #expect(!(characters.first?.name.isEmpty ?? true), "El primer personaje debe tener nombre")
                #expect(characters.count == 20, "Debería haber 20 personajes")
            }
            
            @Test("NetworkCharactersMock")
            func getCharactersMockTest() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                
                // WHEN
                let response = await network.getCharacters()
                
                // THEN
                #expect(response != nil, "La respuesta no debería ser nil")
                let characters = response?.data.results ?? []
                #expect(characters.count == 2, "La respuesta mock debería contener 2 pj")
                
            }
        } // Network
        
        @Suite("Respository", .serialized) struct RepoTest{
            @Test("CharactersRepositoryMappedTest")
            func getCharactersMappedTest() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                let repository = CharactersRepository(network: network)
                
                // WHEN
                let characters = await repository.getCharactersMapped()
                
                // THEN
                #expect(!characters.isEmpty, "La lista de personajes debe tener al menos uno")
                #expect(characters[0].name == "3-D Man", "El personaje debe tener un nombre")
            }
            
            @Test("CharactersRespositoryMockMappedTest")
            func getCharacteresMappedMockTest() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                let repository = CharactersRepositoryMock(network: network)
                
                // WHEN
                let characters = await repository.getCharactersMapped()
                
                // THEN
                #expect(!characters.isEmpty, "La lista debería tener al menos un pj")
                #expect(characters.count == 2, "Debería devolver 2 personajes")
            }
            
            
        } // Repository
    }// Data Testing
    
    @Suite("Domain Testing") struct DomainTests {
        @Suite("Usecases", .serialized) struct UseCasesTest{
            @Test("GetCharactersUseCase")
            func getCharactersTest() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                let repository = CharactersRepository(network: network)
                let useCase = CharactersUseCase(repoCharacters: repository)
                
                // WHEN
                let characters = await useCase.getCharacters()
                
                // THEN
                #expect(characters.count == 2, "Debería haber 2 heroes")
                #expect(characters[0].name == "3-D Man", "El personaje debería tener ese nombre ")
            }
        }
    }
}




// GIVEN
// WHEN
// THEN
