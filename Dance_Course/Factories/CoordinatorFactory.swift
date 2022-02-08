//
//  CoordinatorFactory.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

protocol CoordinatorFactory {
    
    func makeLoaderCoordinator(router: Router) -> Coordinatable
//
    func makeOnboardingCoordinator(router: Router) -> Coordinatable
    
//    func makeWelcomeCoordinator(router: Router) -> Coordinatable & WelcomeCoordinatorOutput
    
//    func makeAuthCoordinator(router: Router, authType: AuthType) -> Coordinatable
    
//    func makeRegistCoordinator(router: Router) -> Coordinatable
//
    func makeTabbarCoordinator() -> (configurator: Coordinatable, toPresent: Presentable?)
//
//    func makeRootTabbarItemCoordinator(navigationController: UINavigationController, itemType: TabbarItemType) -> CoordinatorInTabbarInitiable
//
//    func makeCartCoordinator(router: Router) -> Coordinatable
//
//    func makeShoppingCoordinator(router: Router) -> Coordinatable
//
//    func makeOfficesCoordinator(router: Router) -> Coordinatable
//
//    func makeCatalogCoordinator(router: Router) -> Coordinatable
}
