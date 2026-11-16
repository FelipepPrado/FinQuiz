import Observation

@Observable
final class QuizListViewModel {
    private(set) var quizzes: [Quiz] = []

    func carregarQuizzes(usando repository: any QuizRepository) async throws {
        quizzes = try await repository.buscarQuizzes()
    }
}
