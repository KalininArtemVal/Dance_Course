//
//  TabbarViewInput.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

enum TabbarItemType: Int {
    case dashboard    = 0
    case profile
}
protocol TabbarViewInput: AnyObject {
    // vc, itemType
    var onFlow: ((CustomNavigationController, TabbarItemType) -> Void)? { get set }
    var onViewDidLoad: ((CustomNavigationController) -> Void)? { get set }
    var finishFlow: Action? { get set }
    func updateTabbarItem(with item: TabbarItemType, completion: Action?)
}
