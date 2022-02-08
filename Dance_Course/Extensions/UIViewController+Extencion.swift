//
//  UIViewController+Extencion.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

extension UIViewController {
    // swiftlint:disable force_cast
    private static func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }

    static func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
}
