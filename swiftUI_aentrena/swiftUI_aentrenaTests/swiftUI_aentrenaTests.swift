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
        @Suite("Network", .serialized) struct ModelTest{
            @Test("NetworkCharacters")
            func getCharactersTest() async throws {
                // GIVEN
                let network = NetworkCharacters()
                
                // WHEN
                let characters = await network.getCharacters()
                
                // THEN
                #expect(!characters.isEmpty, "La respuesta no debería estar vacia")
                #expect(characters.first?.id != nil, "El primer personaje tiene que tener un id válido")
                #expect(characters.first?.name.isEmpty == false, "El primer personaje debería tener nombre")
            }
            
            @Test("NetworkCharactersMock")
            func getCharactersMockTest() async throws {
                // GIVEN
                let network = NetworkCharactersMock()
                
                // WHEN
                let characters = await network.getCharacters()
                
                // THEN
                #expect(characters.count == 1, "La respuesta no debería estar vacia")
               
            }
        }
    }

}



// GIVEN
// WHEN
// THEN
