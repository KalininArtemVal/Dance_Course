//
//  RouterImp.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

final class RouterImp: NSObject, Router {
    func setCartToModule(_ module: Presentable?) {
        
    }
    
    
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
    }
    
    func isDeeperThan(level: Int) -> Bool {
        guard let count = self.rootController?.viewControllers.count else { return false }
        
        return count >= level
    }
    
    func levelIsEqual(_ level: Int) -> Bool {
        guard let count = self.rootController?.viewControllers.count else { return false }
        
        return count == level
    }
    
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    func present(_ module: Presentable?, on: Presentable?) {
        guard let controller = module?.toPresent(),
              let presentingController = on?.toPresent() else { return }
        
        presentingController.present(controller, animated: true, completion: nil)
    }
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        //        rootController?.present(controller, animated: animated, completion: nil)
        rootController?.topUIViewController()?.present(controller, animated: animated, completion: nil)
    }
    
    func presentOnGlobalRoot(_ module: Presentable?) {
        presentOnGlobalRoot(module, animated: true)
    }
    
    func presentOnGlobalRoot(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }

        DefaultWireframe.rootViewController().present(controller, animated: animated)
    }
    
    func presentOverModal(_ module: Presentable?, completion: Action? = nil) {
        presentOverModal(module, animated: true, completion: completion)
    }
    
    func presentOverModal(_ module: Presentable?, animated: Bool, completion: Action? = nil) {
        guard let controller = module?.toPresent() else { return }
        
        var topVC = rootController?.topUIViewController()
        while let presentedVC = topVC?.presentedViewController {
            topVC = presentedVC
        }
        
//        topVC?.tabBarController?.tabBar.isHidden = true
        
        topVC?.present(controller, animated: animated, completion: completion)
    }
    
    func presentShare(_ data: [URL]) {
        presentShare(data, animated: true)
    }
    
    func presentShare(_ data: [URL], animated: Bool) {
        let topVC = rootController?.topUIViewController()
        
        let shareVC = UIActivityViewController(activityItems: data, applicationActivities: nil)
        topVC?.present(shareVC, animated: animated, completion: nil)
    }
    
    func expandBottomSheetToMax(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        
//        controller.sheetViewController?.resize(to: .marginFromTop(Constants.dynamicNavBarOffset))
    }
    
//    func dismissBottomSheetWithActiveBackground(_ module: Presentable?, completion: Action?) {
//        guard let controller = module?.toPresent() else { return }
//
//        controller.sheetViewController?.animateOut(duration: 0.3, completion: nil)
//        completion?()
//    }
    
    func dismissModule(_ module: Presentable?, completion: Action?) {
        guard let controller = module?.toPresent() else { return }
        
        controller.dismiss(animated: true, completion: completion)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: Action?) {
        var topVC = rootController?.topUIViewController()
        while let presentedVC = topVC?.presentedViewController {
            topVC = presentedVC
        }
        
        topVC?.dismiss(animated: animated, completion: completion)
    }

    func onCardClick(_ module: Presentable?, snapshotView: UIView?, cellFrame: CGRect, titleFrame: CGRect, title: String) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
//        animator.snapshot = snapshotView?.snapshotView(afterScreenUpdates: false)
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
        presentOverModal(module)
    }
    
//    func hideBasket(animated: Bool, completion: Action?) {
//        if let basketTBC = rootController?.tabBarController as? BasketTabBarController {
//            basketTBC.setCartVisible(visible: false, animated: animated, completion: completion)
//        }
//    }
//
//    func showBasket(animated: Bool, completion: Action?) {
//        if let basketTBC = rootController?.tabBarController as? BasketTabBarController {
//            basketTBC.setCartVisible(visible: true, animated: animated, completion: completion)
//        }
//    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool = false, completion: Action?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        if let completion = completion {
            completions[controller] = completion
        }
        controller.hidesBottomBarWhenPushed = hideBottomBar
        if hideBottomBar {
            controller.extendedLayoutIncludesOpaqueBars = true
            controller.edgesForExtendedLayout = .bottom
        }
    
//        if hideBottomBar, let basketTBC = rootController?.tabBarController as? BasketTabBarController {
//            basketTBC.tabBarHiddenOnPush(isHidden: hideBottomBar)
//            completions[controller] = {
//                basketTBC.tabBarHiddenOnPush(isHidden: !hideBottomBar)
//                if hideBottomBar {
//                    controller.extendedLayoutIncludesOpaqueBars = false
//                    controller.edgesForExtendedLayout = .all
//                }
//
//                completion?()
//            }
//        }
        
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func popModule(to module: Presentable?) {
        popModule(to: module, animated: true)
    }
    
    func popModule(to module: Presentable?, animated: Bool) {
        if let correctModule = module as? UIViewController,
           let navigationController = rootController,
           case let navigationStack = navigationController.viewControllers,
           navigationStack.contains(correctModule),
           let controllers = navigationController.popToViewController(correctModule, animated: animated) {
            _ = controllers.compactMap({ runCompletion(for: $0) })
        }
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: true)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
    
    func isEmpty() -> Bool {
        return self.rootController?.viewControllers.isEmpty ?? true
    }
    
    func isModal() -> Bool {
        return rootController?.presentedViewController != nil
    }
    
//    func hideTabBar() {
//        self.hideTabBar(animated: false, completion: nil)
//    }
//    
//    func showTabBar() {
//        self.showTabBar(animated: false, completion: nil)
//    }
    
//    func hideTabBar(animated: Bool, completion: Action?) {
//        if let basketTBC = rootController?.tabBarController as? BasketTabBarController {
//            basketTBC.setTabBarVisible(visible: false, animated: animated, completion: completion)
//        }
//    }
    
//    func showTabBar(animated: Bool, completion: Action?) {
//        if let basketTBC = rootController?.tabBarController as? BasketTabBarController {
//            basketTBC.setTabBarVisible(visible: true, animated: animated, completion: completion)
//        }
//    }
    
    func dismissModalStack(_ module: Presentable?, completion: Action?) {
        guard let controller = module?.toPresent() else { return }
        
        var initialPresentingViewController = controller.presentingViewController
        while let previousPresentingViewController = initialPresentingViewController?.presentingViewController {
            initialPresentingViewController = previousPresentingViewController
        }
        
        initialPresentingViewController?.dismiss(animated: true, completion: completion)
    }
    
//    func setCartToModule() {
//        setCartToModule(rootController?.topUIViewController())
//    }
    
//    func setCartToModule(_ module: Presentable?) {
//        guard let controller = module?.toPresent() else { return }
//
//        if var basketInteractable = controller as? BaseBasketView {
//            var basketView = (rootController as? BaseBasketView)?.basketView
//            basketView = basketView ?? (rootController?.tabBarController as? BasketTabBarController)?.basketView
//
//            basketInteractable.basketView = basketView
//        }
//    }

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}

extension RouterImp: UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        animator.transitionMode = .present
//        return animator
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        animator.transitionMode = .dismiss
//        return animator
//    }
}
