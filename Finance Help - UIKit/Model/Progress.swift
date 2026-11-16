import SwiftData

@Model
final class Progress{
    var quizId: String
    var questionIndex: String?
    var correctAnswers: [String] = []
    var completedAt: Bool = false
    
    init(quizId: String, questionIndex: String? = nil) {
        self.quizId = quizId
        self.questionIndex = questionIndex
    }
}
