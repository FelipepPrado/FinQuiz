import Foundation

struct NotionQuizResponse: Decodable {
    let results: [NotionQuizPage]
    let hasMore: Bool
    let nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case results
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }
}

struct NotionQuizPage: Decodable {
    let id: String
    let properties: NotionQuizProperties
}

struct NotionQuizProperties: Decodable {
    let title: NotionTitleProperty
    let theme: NotionSelectProperty
    let difficulty: NotionSelectProperty
    let description: NotionRichTextProperty
    let order: NotionNumberProperty
    let questions: NotionRelationProperty

    enum CodingKeys: String, CodingKey {
        case title = "Nome"
        case theme = "Tema"
        case difficulty = "Dificuldade"
        case description = "Descrição"
        case order = "Ordem"
        case questions = "Perguntas"
    }
}

struct NotionTitleProperty: Decodable {
    let title: [NotionText]
}

struct NotionSelectProperty: Decodable {
    let select: NotionSelectOption?
}

struct NotionSelectOption: Decodable {
    let name: String
}

struct NotionRichTextProperty: Decodable {
    let richText: [NotionText]

    enum CodingKeys: String, CodingKey {
        case richText = "rich_text"
    }
}

struct NotionNumberProperty: Decodable {
    let number: Double?
}

struct NotionRelationProperty: Decodable {
    let relation: [NotionRelationReference]
    let hasMore: Bool?

    enum CodingKeys: String, CodingKey {
        case relation
        case hasMore = "has_more"
    }
}

struct NotionRelationReference: Decodable {
    let id: String
}

struct NotionText: Decodable {
    let plainText: String

    enum CodingKeys: String, CodingKey {
        case plainText = "plain_text"
    }
}
