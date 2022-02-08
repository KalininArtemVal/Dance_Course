//
//  Router.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import Foundation
import UIKit

protocol Router: AnyObject, Presentable {
    
    func isEmpty() -> Bool
    func isModal() -> Bool
    func isDeeperThan(level: Int) -> Bool
    func levelIsEqual(_ level: Int) -> Bool
    
//    func hideBasket(animated: Bool, completion: Action?)
//    func showBasket(animated: Bool, completion: Action?)
//    func hideTabBar()
//    func showTabBar()
//    func hideTabBar(animated: Bool, completion: Action?)
//    func showTabBar(animated: Bool, completion: Action?)
    
//    func setCartToModule()
    func setCartToModule(_ module: Presentable?)

    func present(_ module: Presentable?, on: Presentable?)
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func presentOnGlobalRoot(_ module: Presentable?)
    func presentOnGlobalRoot(_ module: Presentable?, animated: Bool)
    func presentOverModal(_ module: Presentable?, completion: Action?)
    func presentOverModal(_ module: Presentable?, animated: Bool, completion: Action?)
    func presentShare(_ data: [URL])
    func presentShare(_ data: [URL], animated: Bool)
//    func presentBottomSheetWithActiveBackground(
//        _ module: Presentable?, isExpanded: Bool, background backgroundModule: Presentable?,
//        onShow: Action?, onDismiss: Action?,
//        isForCart: Bool
//    )
//    func dismissBottomSheetWithActiveBackground(_ module: Presentable?, completion: Action?)
    func expandBottomSheetToMax(_ module: Presentable?)

    func onCardClick(_ module: Presentable?, snapshotView: UIView?, cellFrame: CGRect, titleFrame: CGRect, title: String)
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: Action?)

    func popModule()
    func popModule(animated: Bool)
    func popModule(to module: Presentable?)
    func popModule(to module: Presentable?, animated: Bool)

    func dismissModule(_ module: Presentable?, completion: Action?)
    func dismissModule()
    func dismissModule(animated: Bool, completion: Action?)
    
    func dismissModalStack(_ module: Presentable?, completion: Action?)

    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}

protocol WindowedRouter: Router {
    func dismissWindow()
}
