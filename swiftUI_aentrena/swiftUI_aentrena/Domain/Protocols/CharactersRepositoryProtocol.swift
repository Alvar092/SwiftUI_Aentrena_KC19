//
//  CharactersRepositoryProtocol.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 11/6/25.
//

import Foundation

protocol CharactersRepositoryProtocol {
    func getCharactersMapped() async -> [CharacterResult]
    func getSeriesMapped(id: String) async -> [Series]
}
