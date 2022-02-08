//
//  UIViewController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit


protocol TopUIViewController {
    func topUIViewController() -> UIViewController?
}

extension UIWindow : TopUIViewController {
    func topUIViewController() -> UIViewController? {
        if let rootViewController = self.rootViewController {
            return self.recursiveTopUIViewController(from: rootViewController)
        }
        
        return nil
    }
    
    private func recursiveTopUIViewController(from: UIViewController?) -> UIViewController? {
        if let topVC = from?.topUIViewController() { return recursiveTopUIViewController(from: topVC) ?? from }
        return from
    }
}

extension UIViewController : TopUIViewController {
    @objc open func topUIViewController() -> UIViewController? {
        return self.presentedViewController
    }
}

extension UINavigationController {
    override open func topUIViewController() -> UIViewController? {
        return self.visibleViewController
    }
}

extension UITabBarController {
    override open func topUIViewController() -> UIViewController? {
        return self.selectedViewController ?? presentedViewController
    }
}

extension UIViewController {
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
}

extension UITabBar {
    
    func setTabBarSeparatorHidden(value: Bool) {
        if value == true {
            layer.borderColor = UIColor.clear.cgColor
        } else {
            layer.borderWidth = 1
//            layer.borderColor = UIColor.tabBarGrayBorderColor.cgColor
        }
        clipsToBounds = true
    }
}
