import UIKit

final class LearningSheetView: UIViewController {
    
    private let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: nil, action: nil)
    
    private let confirmButton = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .plain, target: nil, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Isso para o caso de safeArea (mas acho que não é bom fazer isso)
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        setupActions()
    }
    
    private func setupViews() {
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = confirmButton
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        return
    }
    
    private func setupActions() {
        closeButton.primaryAction = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }
        
        confirmButton.primaryAction = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }
    }
    
    @objc private func actionCloseButton() {
        dismiss(animated: true)
    }
}

#Preview {
    UINavigationController(
        rootViewController: LearningSheetView()
    )
}
