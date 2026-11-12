import UIKit

class LearningView: UIViewController {
    private lazy var openSheetButton = UIBarButtonItem(
        systemItem: .add,
        primaryAction: UIAction { [weak self] _ in
            let sheet = LearningSheetView()

            let navigationController = UINavigationController(
                rootViewController: sheet
            )
            
            navigationController.modalPresentationStyle = .pageSheet
            self?.present(navigationController, animated: true)
        }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        navigationItem.rightBarButtonItem = openSheetButton
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        return
    }
}


#Preview {
    UINavigationController(
        rootViewController: LearningView()
    )
}
