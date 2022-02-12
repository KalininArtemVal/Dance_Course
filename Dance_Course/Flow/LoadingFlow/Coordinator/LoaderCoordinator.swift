//
//  LoaderCoordinator.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import UIKit

class LoaderCoordinator: BaseCoordinator {
    
    private let factory: LoaderModuleFactory
    private let router: Router
    
    private var loaderModule: (LoaderViewInput & LoaderViewOutput)?
    
    init(with factory: LoaderModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLoaderModule()
        sync()
    }
    
    // MARK: - Private Methods
    
    private func showLoaderModule() {
        loaderModule = factory.makeLoaderModule()
        router.setRootModule(loaderModule)
        
    }
    
    private func sync() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            print("finishFlow")
            self.finishFlow?()
        })
    }
    
}
