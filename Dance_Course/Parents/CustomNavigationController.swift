//
//  CustomNavigationController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

final class CustomNavigationController: UINavigationController {

    // MARK: - Open properties
    
    var duringPushAnimation = false
    
    // MARK: - Overriden methods
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return visibleViewController?.preferredStatusBarStyle ?? .default
    }

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func awakeFromNib() {
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    deinit {
//        print("\(self.nameOfClass) deinit")
        delegate = nil
        interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Private methods

    private func configureUI() {
        navigationBar.removeFromSuperview()
        view.backgroundColor = .clear
        delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        duringPushAnimation = true
        super.pushViewController(viewController, animated: animated)
    }
}

// MARK: - UINavigationControllerDelegate

extension CustomNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let navigationController = navigationController as? CustomNavigationController else { return }
        navigationController.duringPushAnimation = false
    }
}

// MARK: - UIGestureRecognizerDelegate

extension CustomNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer else { return true }
        return viewControllers.count > 1 && duringPushAnimation == false
    }
}
