
import Foundation

struct CharactersResponse: Codable {
    let data: CharactersData
}

struct CharactersData: Codable {
    let results: [CharacterResult]
}

struct CharacterResult: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail

}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}


struct SeriesResponse: Codable {
    let data: SeriesData
}

struct SeriesData: Codable {
    let results: [Series]
}

struct Series: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case thumbnail
    }
}
