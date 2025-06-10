
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
    let series: Series
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

struct Series: Codable {
    let available: Int
    let collectionURL: String
    let items: [SerieItem]
    let returned: Int
    
    enum CodingKeys: String, CodingKey {
        case available
        case collectionURL = "collectionURI"
        case items
        case returned 
    }
}

struct SerieItem: Codable {
    let resourceURI: String
    let name: String
}
