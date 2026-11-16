import Foundation

protocol QuizRepository {
    func buscarQuizzes() async throws -> [Quiz]
}
