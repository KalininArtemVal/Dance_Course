//
//  TabbarViewModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 10.02.2022.
//

import UIKit

struct AppTabBarCellData {
    let unselectedIcon: UIColor?
    let selectedIcon: UIColor?
}

protocol AppTabBarModelProtocol {
    var choiceIndex: Int { get set }
    var allData: [AppTabBarCellData] { get }
}

final class AppTabBarModel: AppTabBarModelProtocol {
    
    var choiceIndex: Int = 0
    
    public var allData = [
        AppTabBarCellData(unselectedIcon: .red, selectedIcon: .cyan),
        AppTabBarCellData(unselectedIcon: .green, selectedIcon: .cyan)
    ]
}
