import Foundation

enum NotionAPIError: Error {
    case respostaInvalida
    case statusHTTP(Int)
}

struct NotionQuizAPI: QuizRepository {
    let token: String

    func buscarQuizzes() async throws -> [Quiz] {
        //URL dita pelo Notion # https://api.notion.com/v1/data_sources/id/query #
        guard let url = URL(
            string: "https://api.notion.com/v1/data_sources/a192b0d9-23ac-458b-b792-7dfe57394662/query"
        ) else {
            throw URLError(.badURL)
        }

        var quizzes: [Quiz] = []
        var cursor: String?

        repeat {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.setValue("2026-03-11", forHTTPHeaderField: "Notion-Version")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            var body: [String: Any] = ["page_size": 100]
            if let cursor {
                body["start_cursor"] = cursor
            }
            request.httpBody = try JSONSerialization.data(withJSONObject: body)

            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NotionAPIError.respostaInvalida
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NotionAPIError.statusHTTP(httpResponse.statusCode)
            }

            let resposta = try JSONDecoder().decode(NotionQuizResponse.self, from: data)
            quizzes.append(contentsOf: resposta.results.map(\.quiz))

            if resposta.hasMore {
                guard let nextCursor = resposta.nextCursor, !nextCursor.isEmpty,
                      nextCursor != cursor else {
                    throw NotionAPIError.respostaInvalida
                }
                cursor = nextCursor
            } else {
                cursor = nil
            }
        } while cursor != nil

        return quizzes.sorted { $0.order < $1.order }
    }
}
