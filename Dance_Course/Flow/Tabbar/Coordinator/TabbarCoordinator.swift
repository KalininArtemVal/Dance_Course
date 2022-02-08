//
//  TabbarCoordinator.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import UIKit

class TabbarCoordinator: BaseCoordinator, TabbarViewOutput {
    
    // MARK: - TabbarViewOutput
    
    private let tabbarView: TabbarViewInput
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarViewInput, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    deinit {
        print("TabbarCoordinator deinit")
    }
    
    override func start() {
        tabbarView.onViewDidLoad = { [weak self] (navigationController) in
            print("onViewDidLoad")
            self?.runItemFlow(navController: navigationController, itemType: .dashboard)
        }
        tabbarView.onFlow = { [weak self] (navigationController, itemType) in
            print("tabbarView.onFlow = \(itemType)")
            switch itemType {
            case .dashboard:    break
            default:            UIApplication.statusBarBackgroundColor = .clear
            }
            self?.runItemFlow(navController: navigationController, itemType: itemType)
        }
        tabbarView.finishFlow = finishFlow
        
    }
    
    private func runItemFlow(navController: CustomNavigationController, itemType: TabbarItemType) {
        if navController.viewControllers.isEmpty == true {
            let itemCoordinator = self.coordinatorFactory.makeRootTabbarItemCoordinator(navigationController: navController, itemType: itemType)
            itemCoordinator.start()
            
            itemCoordinator.finishFlow = { [weak self, weak itemCoordinator] in
                self?.removeDependency(itemCoordinator)
                guard let strongSelf = self else {
                    return
                }
                strongSelf.finishFlow?()
            }
            
            self.addDependency(itemCoordinator)
        }
    }
}
