//
//  CustomNavigationView.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

import UIKit

typealias NavigationViewHandler = (_ type: NavigationButtonType) -> Void

protocol CustomNavigationView: NSObjectProtocol, ViewPresentable {
    var actionHandler: NavigationViewHandler? { get set }
    func updateTitle(_ title: String)
}
