//
//  NavigationBarHelper.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//
import UIKit
import RxSwift
import RxRelay
import SnapKit

enum NavBarStyle: Int {
    case mainStyle
    case closeStyle
    case backStyle
}

class NavigationBarHelper {
    static func customizeNavBarFor(for vc: Presentable,
                                   style: NavBarStyle,
                                   title: String? = nil,
                                   rightButtonRelay: BehaviorRelay<Bool>? = nil,
                                   actionHandler: NavigationViewHandler?,
                                   isPresent: Bool = false,
                                   isModalNavigation: Bool = false) -> CustomNavigationView? {
        let navigationView = NavigationViewFactoryImp().makeNavigationView(with: style, title: title, rightButtonRelay: rightButtonRelay)
        if let view = navigationView.toPresent() {
            vc.toPresent()?.view.addSubview(view)
            
            var topOffsetValue: CGFloat = 0.0
            var styles = [NavBarStyle.mainStyle]
            if isPresent {
                styles.append(NavBarStyle.mainStyle)
            }
            if isModalNavigation && UIDevice.current.isSmallScreen {
                topOffsetValue = 12
            }
            if (!styles.contains(style) && !isModalNavigation) {
                
                // in order to show view without any offsets for this case http://prntscr.com/w11sy6
                topOffsetValue = Constants.navigationViewTopOffsetValue
            }
            
            
            if let parentView = vc.toPresent()?.view {
                view.snp.makeConstraints { (make) -> Void in
                    make.height.equalTo(isModalNavigation ? 50 : Constants.navigationViewHeight)
                    make.top.equalTo(parentView.snp.top).offset(topOffsetValue)
                    make.left.equalTo(parentView.snp.left)
                    make.right.equalTo(parentView.snp.right)
                }
            }
            
            navigationView.actionHandler = actionHandler
            return navigationView
        }
        return nil
    }
    
    static func customizeModalBarFor(vc: Presentable,
                                     style: ModalNavigationBarStyle,
                                     title: String,
                                     leftHandler: Action?,
                                     rightHandler: Action?) -> ModalNavigationBar {
        let modalBar = NavigationViewFactoryImp().makeModalNavigationBar(with: style,
                                                                         title: title,
                                                                         onLeft: leftHandler,
                                                                         onRight: rightHandler)
        
        vc.toPresent()?.view.addSubview(modalBar)
        
        var topOffsetValue: CGFloat = 0.0
        if [UIModalPresentationStyle.fullScreen,
            UIModalPresentationStyle.overFullScreen].contains(vc.toPresent()?.modalPresentationStyle) {
            topOffsetValue = Constants.statusBarHeight
        }
        if let parentView = vc.toPresent()?.view {
            modalBar.snp.makeConstraints { (make) -> Void in
                make.height.equalTo(Constants.navigationViewHeight)
                make.top.equalTo(parentView.snp.top).offset(topOffsetValue)
                make.left.equalTo(parentView.snp.left)
                make.right.equalTo(parentView.snp.right)
            }
        }
        
        return modalBar
    }
    
}
