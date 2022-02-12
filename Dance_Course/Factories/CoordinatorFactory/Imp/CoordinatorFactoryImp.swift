//
//  CoordinatorFactoryImp.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeLoaderCoordinator(router: Router) -> Coordinatable {
        return LoaderCoordinator(with: ModuleFactoryImp(), router: router)
    }
    
    func makeTabbarCoordinator() -> (configurator: Coordinatable, toPresent: Presentable?) {
        let controller = TabbarController.controllerFromStoryboard(.main)
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }
    
    func makeRootTabbarItemCoordinator(navigationController: UINavigationController, itemType: TabbarItemType) -> CoordinatorInTabbarInitiable {
        var coordinatorClassName = ""
        switch itemType {
        case .dashboard: coordinatorClassName = .dashboardCoordinatorClassName
        case .profile: coordinatorClassName = .profileCoordinatorClassName

        }
        
        guard let coordinatorClass = NSClassFromString(coordinatorClassName) as? CoordinatorInTabbarInitiable.Type else {
            fatalError("makeRootTabbarItemCoordinator fatal error")
        }
        return coordinatorClass.init(router: router(navigationController),
                                     factory: ModuleFactoryImp(),
                                     coordinatorFactory: CoordinatorFactoryImp())
    }
  
    // MARK: - Private methods
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return CustomNavigationController.controllerFromStoryboard(.main)
        }
    }
    
}
