//
//  HerosModel.swift
//  swiftUI_aentrena
//
//  Created by Álvaro Entrena Casas on 10/6/25.
//

import Foundation

struct CharactersModel: Codable, Identifiable, Sendable {
    var id: UUID
    var name: String
    var description: String
    var modified: String
    var thumbnail: Image
    var resourceURL: String
    var series: SeriesList
}

struct Image: Codable {
    let path: String
    let `extension`: String
}

struct SeriesList: Codable {
    let available: Int
    let collectionURL: String
    let items: [SeriesSummary]
    let returned: Int
}

struct SeriesSummary: Codable {
    let resourceURL: String
    let name: String
}

