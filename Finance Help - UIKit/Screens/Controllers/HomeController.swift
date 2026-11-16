import UIKit

final class HomeController: UITabBarController {
    
    private let quizList: UINavigationController = {
        let quizzes = QuizListController()
        quizzes.title = "Quizzes"

        let quizzesNavigation = UINavigationController(
            rootViewController: quizzes
        )
        quizzesNavigation.tabBarItem = UITabBarItem(
            title: "Quizzes",
            image: UIImage(systemName: "list.bullet"),
            tag: 0
        )
        
        return quizzesNavigation
    }()
    
    private let concludedQuizzes: UINavigationController = {
        let history = ConcludedsQuizController()
        history.title = "Histórico"

        let historyNavigation = UINavigationController(
            rootViewController: history
        )
        historyNavigation.tabBarItem = UITabBarItem(
            title: "Histórico",
            image: UIImage(systemName: "clock"),
            tag: 1
        )
        
        return historyNavigation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [quizList, concludedQuizzes]
    }
}

#Preview {
    HomeController()
}
