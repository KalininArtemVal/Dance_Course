//
//  CoordinatorInTabbarInitiable.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//


typealias SelectTabbarItemBlock = (TabbarItemType) -> Void

protocol CoordinatorInTabbarInitiable: Coordinatable {
    init(router: Router,
         factory: ModuleFactoryList,
         coordinatorFactory: CoordinatorFactory)
    var selectTabbarItemBlock: SelectTabbarItemBlock? { get set }
    var processTabbarSelectionWithCoordinatorMode: SelectTabbarItemBlock? { get set }
}
