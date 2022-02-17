//
//  UIWindow+Extension.swift
//  Dance_Course
//
//  Created by Артем Калинин on 14.02.2022.
//

import UIKit

extension UIWindow {
    static func window(level: UIWindow.Level, rootViewController: UIViewController) -> UIWindow {
        let window: UIWindow
        
        if #available(iOS 13.0, *) {
            if let scene = UIApplication.shared.connectedScenes.lazy
                    .compactMap({ $0 as? UIWindowScene })
                    .sorted(by: { (lhs, rhs) -> Bool in
                        switch (lhs.activationState, rhs.activationState) {
                            case (.foregroundActive, _),
                                 (.foregroundInactive, .background),
                                 (.foregroundInactive, .unattached),
                                 (.background, .unattached):
                                return true
                            default:
                                return false
                        }
                    })
                .first {
                window = UIWindow(windowScene: scene)
            } else {
                window = UIWindow(frame: UIScreen.main.bounds)
            }
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        window.rootViewController = rootViewController
        window.windowLevel = level
        
        return window
    }
}
