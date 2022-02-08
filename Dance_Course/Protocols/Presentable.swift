//
//  Presentable.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }
}

protocol ViewIsBeingShowable {
    func isBeingShowableViewForModule(module: Presentable) -> Bool
}
