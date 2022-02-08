//
//  LoaderModuleFactories.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

protocol LoaderModuleFactory {
    func makeLoaderModule() -> LoaderViewInput & LoaderViewOutput
}
