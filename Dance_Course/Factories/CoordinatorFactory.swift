//
//  CoordinatorFactory.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

protocol CoordinatorFactory {
    
    func makeLoaderCoordinator(router: Router) -> Coordinatable
//
    func makeTabbarCoordinator() -> (configurator: Coordinatable, toPresent: Presentable?)
//
    func makeRootTabbarItemCoordinator(navigationController: UINavigationController, itemType: TabbarItemType) -> CoordinatorInTabbarInitiable
    
}
