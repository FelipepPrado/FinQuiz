import Foundation

struct Quiz {
    let id: String
    let title: String
    let theme: String
    let difficulty: DifficultyLevel
    let description: String
    let order: Int
    let questionIDs: [String]
}

enum DifficultyLevel: String, Codable {
    case easy
    case medium
    case hard
    case noLevel
}
