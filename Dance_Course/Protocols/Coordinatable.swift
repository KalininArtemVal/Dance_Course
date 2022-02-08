//
//  Coordinatable.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import Foundation

protocol Coordinatable: AnyObject {
    var finishFlow: Action? { get set }
    func start()
}
