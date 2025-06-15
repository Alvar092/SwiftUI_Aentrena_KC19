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
            @Test("GetCharacters")
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
            
            @Test("GetCharactersMock")
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
            
            @Test("GetSeries")
            func getSeriesTest() async throws {
                // GIVEN
                let network = NetworkCharacters()
                let id = "1011334"
            
                // WHEN
                let response = await network.getSeries(id: id)
                
                // THEN
                #expect(response != nil, "La respuesta no puede ser nil")
                let series = response?.data.results ?? []
                #expect(series.count == 3, "La respuesta debería contener 3 series")
            }
            
            @Test("GetSeriesMock")
            func getSeriesMockTest() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                
                // WHEN
                let response = await network.getSeries()
                
                // THEN
                #expect(response != nil, "La respuesta no puede ser nil")
                let series = response?.data.results ?? []
                #expect(series.count == 3, "La respuesta debería contener las 3 series")
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
            
            @Test("CharactersRespositoryMappedMockTest")
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
            
            @Test("SeriesRepositoryMappedTest")
            func getSeriesMappedTest() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                let repository = CharactersRepository(network: network)
                let id = "1011334"
                
                
                // WHEN
                let series = await repository.getSeriesMapped(id: id)
                
                // THEN
                #expect(!series.isEmpty, "La lista de series no puede estar vacia")
                #expect(series.count == 3, "El mock debería devolver las 3 series")
            }
            
            @Test("SeriesRepositoryMappedMockTest")
            func getSeriesMappedMock() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                let repository = CharactersRepositoryMock()
                
                // WHEN
                let series = await repository.getSeriesMapped()
                
                // THEN
                #expect(!series.isEmpty, "La lista de series no puede estar vacia")
                #expect(series.count == 3, "El mock debería devolver las 3 series")
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
            
            @Test("getCharactersUseCaseMock")
            func getCharactersMockTest() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                let repository = CharactersRepository(network: network)
                let useCase = CharactersUseCaseMock(repoCharacters: repository)
                
                // WHEN
                let characters = await useCase.getCharacters()
                
                // THEN
                #expect(characters.count == 2, "Debería haber 2 heroes")
                #expect(characters[0].name == "3-D Man", "El personaje debería tener ese nombre ")
            }
            
            @Test("getSeriesUseCase")
            func getSeriesTest() async throws {
                // GIVEN
                let repository = CharactersRepositoryMock()
                let useCase = SeriesUseCase(repo: repository)
                let id = "1011334"
                
                // WHEN
                let series = await useCase.getSeries(id: id)
                
                // THEN
                #expect(series.count == 3, "Debería devolver 3 series")
                #expect(series[0].title == "Avengers: The Initiative (2007 - 2010)")
            }
        }
    }
}




// GIVEN
// WHEN
// THEN
