//
//  ProfileModuleFactory.swift
//  Dance_Course
//
//  Created by Артем Калинин on 12.02.2022.
//

protocol ProfileModuleFactory {
    func makeProfileModule() -> ProfileViewInput & ProfileViewOutput
}
