//
//  ApplicationCoordinator.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import UIKit
import Foundation

private let onboardingShowingStatusKey = "onboardingShowingStatusKey"
private var onboardingWasShown: Bool {
    set (new) {
        UserDefaults.standard.set(new, forKey: onboardingShowingStatusKey)
        UserDefaults.standard.synchronize()
    }
    get {
        return UserDefaults.standard.bool(forKey: onboardingShowingStatusKey)
    }
}

private enum LaunchInstructor {
    case main, onboarding
    
    static func configure(isAuthorized: Bool = false,
                          onboardingWasShown: Bool = onboardingWasShown) -> LaunchInstructor {
        switch (isAuthorized, onboardingWasShown) {
        case (_, false): return .onboarding
        case (true, true): return .main
        case (false, true): return .main
        }
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private var router: Router
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure(isAuthorized: true)
    }
    
//    private let profileUseCase: IProfileUseCase
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
//        self.profileUseCase = ProfileUseCaseImpl(api: Dependencies.sharedDependencies.api)
    }
    
    override func start() {
        runLoadingFlow()
    }
    
    private func runInstructor() {
        switch instructor {
        case .onboarding: runOnboardingFlow()
        case .main: runMainFlow()
        }
    }
    
    private func runLoadingFlow() {
        print("runLoadingFlow")
        let coordinator = coordinatorFactory.makeLoaderCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.runInstructor()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runOnboardingFlow() {
        print("run onboarding flow")
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            onboardingWasShown = true
            self?.runInstructor()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
//        setCustomNavController()
        let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.runInstructor()
            self?.removeDependency(coordinator)
        }
        
        addDependency(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
}

extension ApplicationCoordinator {
    func setNativeNavController() {
        let navController = UINavigationController()
        let routerNav = RouterImp(rootController: navController)
        self.router = routerNav
        // swiftlint:disable force_cast
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navController
    }
    
//    func setCustomNavController() {
//        let navController = CustomNavigationController(rootViewController: <#UIViewController#>)
//        let routerNav = RouterImp(rootController: navController)
//        self.router = routerNav
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = navController
//    }
}
