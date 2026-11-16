extension NotionQuizPage {
    var quiz: Quiz {
        Quiz(
            id: id,
            title: properties.title.title
                .map(\.plainText)
                .joined(),
            theme: properties.theme.select?.name ?? "No theme",
            difficulty: mapDifficulty(
                properties.difficulty.select?.name
            ),
            description: properties.description.richText
                .map(\.plainText)
                .joined(),
            order: Int(properties.order.number ?? 0),
            questionIDs: properties.questions.relation.map(\.id)
        )
    }
}

private func mapDifficulty(_ value: String?) -> DifficultyLevel {
    switch value {
    case "Fácil":
        return .easy

    case "Médio":
        return .medium

    case "Difícil":
        return .hard

    default:
        return .noLevel
    }
}
