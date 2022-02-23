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
    
    var isSelected: BehaviorRelay<DrinksType> = BehaviorRelay<DrinksType>(value: .all)
    
    var sections = BehaviorRelay<[DashboardSectionModel]>(value: [])
    
    init() {
        displayItems()
    }
    
    func displayItems() {
        sections.accept(generateSection())
    }
    
    private func generateSection() -> [DashboardSectionModel] {
        let items: [DashboardSectionModel] = [
            .mainSection(items: [
                .headerItem,
                .promoItem,
                .sliderMenuItem,
                .contentItem
            ])
        ]
        return items
    }
}
