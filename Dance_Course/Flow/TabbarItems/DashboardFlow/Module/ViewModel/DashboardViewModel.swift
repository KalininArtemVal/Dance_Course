//
//  DashboardViewModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import RxSwift
import RxDataSources
import RxRelay
import UIKit

class DashboardViewModel {
    
    var sections = BehaviorRelay<[DashboardSectionModel]>(value: [])
    
    init() {
        displayItems()
    }
    
    func displayItems() {
        sections.accept(generateSection())
    }
    
    private func generateSection() -> [DashboardSectionModel] {
        
        var items: [DashboardSectionModel] = [.mainSection(items: [.headerItem])]
        
        return items
    }
}
