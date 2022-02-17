//
//  NavigationViewFactoryImp.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//
import RxRelay

import UIKit

final class NavigationViewFactoryImp: NavigationViewFactory {
    
    let commonFrame: CGRect = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: Constants.navigationViewHeight)
    let modalFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
    
    func makeNavigationView(with style: NavBarStyle, title: String? = nil, rightButtonRelay: BehaviorRelay<Bool>? = nil) -> CustomNavigationView {
        switch style {
        
        case .mainStyle, .closeStyle, .backStyle:
            return makeDashboardNavigationView(title: title, style: style)
            
        }
    }
    
    func makeModalNavigationBar(with style: ModalNavigationBarStyle, title: String, onLeft: Action?, onRight: Action?) -> ModalNavigationBar {
        let viewModel = ModalNavigationBarViewModel(title: title, style: style)
        let modalBar = ModalNavigationBar(frame: modalFrame)
        
        modalBar.viewModel = viewModel
        modalBar.onLeft = onLeft
        modalBar.onRight = onRight
        
        modalBar.setupUI()
        
        return modalBar
    }
    
    
    // MARK: - Private Methods
    
    private func makeDashboardNavigationView(title: String?,
                                              isShowBackButton: Bool = false,
                                              rightButtonRelay: BehaviorRelay<Bool>? = nil,
                                              style: NavBarStyle? = nil) -> CustomNavigationView {
        let navigationView = DashboardNavigationView(frame: commonFrame)
        navigationView.updateTitle(title ?? "")
//        navigationView.isEnabledRightButtonRelay = rightButtonRelay
        
        var rightButtonType: NavigationButtonType = .other
        
        switch style {
        case .mainStyle:
            rightButtonType = .other
        case .backStyle:
            rightButtonType = .back
        case .closeStyle:
            rightButtonType = .close
        default:
            break
        }
        
//        navigationView.rightButtonType = rightButtonType

        return navigationView
    }
    
    
}
