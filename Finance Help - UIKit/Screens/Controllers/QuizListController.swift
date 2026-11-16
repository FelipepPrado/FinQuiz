import UIKit

final class QuizListController: UIViewController {
    private let screenView = QuizListView()
    private let viewModel = QuizListViewModel()
    
    override func loadView() {
        view = screenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quizzes"
    }
}

#Preview{
    UINavigationController(
        rootViewController: QuizListController()
    )
}
