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
    case main
    
    static func configure(isAuthorized: Bool = false,
                          onboardingWasShown: Bool = onboardingWasShown) -> LaunchInstructor {
        switch (isAuthorized, onboardingWasShown) {
        case (_, false): return .main
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
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        runLoadingFlow()
    }
    
    private func runInstructor() {
        switch instructor {
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
    
    private func runMainFlow() {
        print("runMainFlow")
        setCustomNavController()
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navController
    }
    // Решить проблему с кастомным Нав контроллером
    
    func setCustomNavController() {
        let navController = CustomNavigationController(rootViewController: UIViewController())
        let routerNav = RouterImp(rootController: navController)
        self.router = routerNav
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navController
    }
}
