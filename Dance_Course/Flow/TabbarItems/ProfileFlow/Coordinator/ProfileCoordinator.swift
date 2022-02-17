//
//  ProfileCoordinator.swift
//  Dance_Course
//
//  Created by Артем Калинин on 12.02.2022.
//


final class ProfileCoordinator: BaseCoordinator, CoordinatorInTabbarInitiable {
    
    var processTabbarSelectionWithCoordinatorMode: SelectTabbarItemBlock?
    
    var selectTabbarItemBlock: SelectTabbarItemBlock?
    
    // MARK: - Private Properties
    
    private let factory: ProfileModuleFactory
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
        let profileView = factory.makeProfileModule()
        
//        dashboardView.viewModel = DashboardViewModel(profileUseCase: profileUseCase, wireframe: wireFrame)
//        configureNavigationView(title: "Профиль", module: profileView)
        router.setRootModule(profileView)
    }
    
    

    // MARK: - Configuring Navigation View

    private func configureNavigationView(title: String,
                                         style: NavBarStyle = .mainStyle,
                                         module: Presentable) {
        
        _ = NavigationBarHelper.customizeNavBarFor(for: module,
                                                       style: style,
                                                       title: title,
                                                       actionHandler: { [weak self] (type) in
                                                        print("navigation button type = \(type)")
                                                        self?.handleNavigationButtonActionWith(type: type)
            })
        
    }
    
    // MARK: - Navigation Buttons Logic
    
    private func handleNavigationButtonActionWith(type: NavigationButtonType) {
        switch type {
        case .back:
            router.popModule(animated: true)
        default:
            break
        }
    }
}
