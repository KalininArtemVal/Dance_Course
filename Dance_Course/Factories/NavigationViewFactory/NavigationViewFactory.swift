//
//  NavigationViewFactory.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

import UIKit
import RxRelay

protocol NavigationViewFactory {
    func makeNavigationView(with style: NavBarStyle, title: String?, rightButtonRelay: BehaviorRelay<Bool>?) -> CustomNavigationView
    func makeModalNavigationBar(with style: ModalNavigationBarStyle, title: String, onLeft: Action?, onRight: Action?) -> ModalNavigationBar
}
