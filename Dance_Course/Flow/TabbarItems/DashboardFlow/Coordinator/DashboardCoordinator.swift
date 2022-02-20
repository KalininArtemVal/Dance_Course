//
//  DashboardCoordinator.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//


final class DashboardCoordinator: BaseCoordinator, CoordinatorInTabbarInitiable {
    
    var selectTabbarItemBlock: SelectTabbarItemBlock?
    
    var processTabbarSelectionWithCoordinatorMode: SelectTabbarItemBlock?
    
    // MARK: - Private Properties
    
    private let factory: DashboardModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
//    private let wireFrame: AlertShowable & ActionSheetShowable
    
    // MARK: - CoordinatorInTabbarInitiable
    
    init(router: Router,
         factory: ModuleFactoryList,
         coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
        
    }
    
    // MARK: - Override Methods
    
    override func start() {
        showDashboardModule()
    }
    
    // MARK: - Run current flow's controllers
    
    private func showDashboardModule() {
        let dashboardView = factory.makeDashboardModule()
        dashboardView.viewModel = DashboardViewModel()
        
//        dashboardView.viewModel = DashboardViewModel(profileUseCase: profileUseCase, wireframe: wireFrame)
        configureNavigationView(title: "Главная", module: dashboardView)
        router.setRootModule(dashboardView)
    }
    
    

    // MARK: - Configuring Navigation View

    private func configureNavigationView(title: String,
                                         style: NavBarStyle = .mainStyle,
                                         module: Presentable) {
        
//        _ = NavigationBarHelper.customizeNavBarFor(for: module,
//                                                       style: style,
//                                                       title: title,
//                                                       actionHandler: { [weak self] (type) in
//                                                        print("navigation button type = \(type)")
//                                                        self?.handleNavigationButtonActionWith(type: type)
//            })
        _ = NavigationBarHelper.customizeNavBarFor(for: module,
                                                   style: style,
                                                   title: title,
                                                   actionHandler: { [weak self] (type) in
                                                    print("navigation button type = \(type)")
                                                    self?.handleNavigationButtonActionWith(type: type)
                                                   },
                                                   isModalNavigation: true)
        
    }
    
    // MARK: - Navigation Buttons Logic
    
    private func handleNavigationButtonActionWith(type: NavigationButtonType) {
        switch type {
        case .back:
            router.popModule(animated: true)
        case .menu:
            
            print("Menu")
        default:
            break
        }
    }
}
