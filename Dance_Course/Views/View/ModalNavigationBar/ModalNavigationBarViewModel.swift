//
//  ModalNavigationBarViewModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

import Foundation

enum ModalNavigationBarStyle {
    case closeStyle
    case backStyle
    case doneWithBackStyle
    case doneStyle
    case closeWithoutRightStyle
}

struct ModalNavigationBarViewModel {
    var title: String
    var style: ModalNavigationBarStyle
}
