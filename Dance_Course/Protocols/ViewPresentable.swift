//
//  ViewPresentable.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//
import UIKit

protocol ViewPresentable {
    func toPresent() -> UIView?
}

extension UIView: ViewPresentable {

    func toPresent() -> UIView? {
        return self
    }
}
