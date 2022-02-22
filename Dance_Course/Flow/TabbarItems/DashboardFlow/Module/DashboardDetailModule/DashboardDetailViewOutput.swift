//
//  DashboardDetailOutputView.swift
//  Dance_Course
//
//  Created by Артем Калинин on 22.02.2022.
//

import UIKit

protocol DashboardDetailViewOutput {
    var onClose:Action? { get set }
    var onCard:Action? { get set }
}
