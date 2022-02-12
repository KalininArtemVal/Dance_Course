//
//  UIApplication+Extencion.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//
import UIKit
import Foundation

extension UIApplication {
    class var statusBarBackgroundColor: UIColor? {
        get {
            return statusBarUIView?.backgroundColor
        } set {
            statusBarUIView?.backgroundColor = newValue
        }
    }
    
    class var statusBarUIView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 987654321
            
            if let statusBar = UIApplication.shared.keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag
                
                UIApplication.shared.keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            return shared.value(forKey: "statusBar") as? UIView
        }
    }
    
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        return viewController
    }
    
    func openURL(url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
