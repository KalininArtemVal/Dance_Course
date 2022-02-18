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
        
        let items: [DashboardSectionModel] = [
            .mainSection(items: [
                .headerItem,
                .contentItem
            ])
            ]
        
        return items
    }
}

//ContentContentViewModel(title: "Latte", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Capuchono", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Mate", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Tea", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Bumble", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Espresso Tonic", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Capuchono", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Tea", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Bumble", image: R.image.coffeeLoadView()),
//                  ContentContentViewModel(title: "Latte", image: R.image.coffeeLoadView()
