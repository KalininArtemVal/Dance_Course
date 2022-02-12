//
//  NavigationButton.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

import UIKit

enum NavigationButtonType: Int {
    case menu       = 0
    case back       = 1
    case close      = 3
    case other      = 19
}

class NavigationButton: UIButton {
    
    // MARK: - Private properties
    
    private (set) var type: NavigationButtonType = .other
    
}
