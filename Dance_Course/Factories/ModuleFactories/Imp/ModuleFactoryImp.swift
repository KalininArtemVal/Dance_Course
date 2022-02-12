//
//  ModuleFactoryImp.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

final class ModuleFactoryImp: ModuleFactoryList {
    
    // MARK: - LoaderModuleFactory
    
    func makeLoaderModule() -> LoaderViewInput & LoaderViewOutput {
        let controller = LoaderViewController()
        controller.providesPresentationContextTransitionStyle = true
        controller.definesPresentationContext = true
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .coverVertical
        return controller
    }
    
    // MARK: - DashboardModuleFactory
    
    func makeDashboardModule() -> DashboardViewInput & DashboardViewOutput {
        let controller = DashboardViewController()
        controller.providesPresentationContextTransitionStyle = true
        controller.definesPresentationContext = true
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .coverVertical
        return controller
    }
    
    // MARK: - ProfileModuleFactory
    
    func makeProfileModule() -> ProfileViewInput & ProfileViewOutput {
        let controller = ProfileViewController()
        controller.providesPresentationContextTransitionStyle = true
        controller.definesPresentationContext = true
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .coverVertical
        return controller
    }
    
}
