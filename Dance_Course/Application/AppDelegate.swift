//
//  AppDelegate.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

//@main
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var rootController: UINavigationController {
        // swiftlint:disable force_cast
        return self.window!.rootViewController as! UINavigationController
    }
    
    
    
    private lazy var applicationCoordinator: Coordinatable = self.makeCoordinator()
    
    private func makeCoordinator() -> Coordinatable {
        
        return ApplicationCoordinator(
            router: RouterImp(rootController: self.rootController),
            coordinatorFactory: CoordinatorFactoryImp()
        )
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _ = Dependencies.sharedDependencies
        applicationCoordinator.start()
        return true
    }


}
