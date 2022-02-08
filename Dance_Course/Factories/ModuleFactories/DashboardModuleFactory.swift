//
//  DashboardModuleFactory.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

protocol DashboardModuleFactory {
    func makeDashboardModule() -> DashboardViewInput & DashboardViewOutput
}
