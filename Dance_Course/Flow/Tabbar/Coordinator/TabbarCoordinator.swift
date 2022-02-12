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
            print(navigationController)
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
            
            itemCoordinator.selectTabbarItemBlock = { [weak self] (item) in
                self?.tabbarView.updateTabbarItem(with: item) { [weak self] in
                    guard let coordinator = self?.findCoordinator(for: item) else { return }
                    coordinator.processTabbarSelectionWithCoordinatorMode?(itemType)
                }
            }
            
            itemCoordinator.finishFlow = { [weak self, weak itemCoordinator] in
                self?.removeDependency(itemCoordinator)
                guard let strongSelf = self else {
                    return
                }
                strongSelf.finishFlow?()
            }
            
            self.addDependency(itemCoordinator)
            itemCoordinator.start()
        }
    }
    
    func findCoordinator(for item: TabbarItemType) -> CoordinatorInTabbarInitiable? {
        guard childCoordinators.isEmpty == false else { return nil }

        var result: Coordinatable?
        switch item {
        case .dashboard:
            result = childCoordinators.first(where: { type(of: $0) === DashboardCoordinator.self })
        case .profile:
            result = childCoordinators.first(where: { type(of: $0) === ProfileCoordinator.self })
        }

        return result as? CoordinatorInTabbarInitiable
    }
    
}
