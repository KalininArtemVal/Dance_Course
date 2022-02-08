//
//  NavigationViewFactoryImp.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

final class NavigationViewFactoryImp: NavigationViewFactory {
    
    let commonFrame: CGRect = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: Constants.navigationViewHeight)
    let modalFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: Constants.modalNavigationHeight)
    
    func makeNavigationView(with style: NavBarStyle, title: String? = nil, rightButtonRelay: BehaviorRelay<Bool>? = nil) -> CustomNavigationView {
        switch style {
        case .rootStyle, .rootStyleWithScanButton: return makePlainStyleNavigationView(title: title, style: style)
        case .backStyle: return makePlainStyleNavigationView(title: title, isShowBackButton: true)
        case .backStyleWithDoneButton, .backStyleWithNonSeparatorLineDoneButton:
            return makePlainStyleNavigationView(title: title, isShowBackButton: true, rightButtonRelay: rightButtonRelay, style: style)
        case .mapRootStyle, .mapBottomSheet: return makeMapStyleNavigationView(style: style)
        case .modalStyle: return makeModalStyleNavigationView(title: title)
        case .backStyleWithStatisticButton, .backStyleWithFilterButton,
             .backStyleWithScanButton, .backStyleWithSeparatorAndScanButton,
             .backStyleWithPlusButton, .backStyle2Line:
            return makePlainStyleNavigationView(title: title, isShowBackButton: true, style: style)
        
//        default:
//            fatalError("Invalid style")
        case .backStyleWithNonSeparatorLine, .backStyleWithCheckButton, .backStyleWithShareAndEditButtons:
            return makePlainStyleNavigationView(title: title, isShowBackButton: true, style: style)
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
    
    private func makePlainStyleNavigationView(title: String?,
                                              isShowBackButton: Bool = false,
                                              rightButtonRelay: BehaviorRelay<Bool>? = nil,
                                              style: NavBarStyle? = nil) -> CustomNavigationView {
        let navigationView = PlainTitleStyleNavigationView(frame: commonFrame)
        navigationView.title = title ?? ""
        navigationView.isShowBackButton = isShowBackButton
        navigationView.titleAlignment = .center
        navigationView.isEnabledRightButtonRelay = rightButtonRelay
        
        var rightButtonType: NavigationButtonType = .other
        var bottomSeparatorStyle: NavigationBottomSeparatorStyle = .origin
        
        switch style {
        case .backStyleWithDoneButton:
            rightButtonType = .done
        case .backStyleWithNonSeparatorLineDoneButton:
            rightButtonType = .done
            bottomSeparatorStyle = .none
        case .backStyleWithCheckButton:
            navigationView.numberOfLines(2)
            rightButtonType = .check
        case .backStyle2Line:
            navigationView.numberOfLines(2)
        case .backStyleWithStatisticButton:
            rightButtonType = .statistic
        case .backStyleWithFilterButton:
            rightButtonType = .filter
        case .rootStyleWithScanButton, .backStyleWithScanButton:
            rightButtonType = .scan
            bottomSeparatorStyle = .none
        case .backStyleWithSeparatorAndScanButton:
            rightButtonType = .scan
            bottomSeparatorStyle = .origin
        case .backStyleWithNonSeparatorLine:
            bottomSeparatorStyle = .none
        case .backStyleWithPlusButton:
            rightButtonType = .plus
        case .backStyleWithShareAndEditButtons:
            rightButtonType = .shareEdit
            bottomSeparatorStyle = .none
        default:
            break
        }
        
        navigationView.rightButtonType = rightButtonType
        navigationView.bottomSeparatorStyle = bottomSeparatorStyle

        return navigationView
    }
    
    private func makeMapStyleNavigationView(style: NavBarStyle? = nil) -> CustomNavigationView {
        let navigationView = MapStyleNavigationView(frame: style == .mapBottomSheet ? modalFrame : commonFrame)

        var leftButtonType: NavigationButtonType = .other

        switch style {
        case .mapBottomSheet:
            leftButtonType = .close
            navigationView.segmentListSelected()
        case .mapRootStyle:
            leftButtonType = .other
        default:
            break
        }
        navigationView.leftButtonType = leftButtonType
        return navigationView
    }
    
    private func makeModalStyleNavigationView(title: String?) -> CustomNavigationView {
        let navigationView = ModalStyleNavigationView(frame: commonFrame)
        navigationView.title = title ?? ""
        return navigationView
    }
    
    
}
