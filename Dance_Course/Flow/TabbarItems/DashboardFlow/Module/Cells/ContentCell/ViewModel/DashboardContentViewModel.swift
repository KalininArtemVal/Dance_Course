//
//  ContentViewModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 18.02.2022.
//

import RxSwift
import RxDataSources
import RxRelay
import UIKit

class DashboardContentViewModel {
    
    var sections = BehaviorRelay<[ContentSectionModel]>(value: [])
    
    init() {
        generateSection()
    }
    
    func generateSection() {
        let items: [ContentSectionModel] = [
            .mainSection(items: [
                .coffeeItem(vm: ContentContentViewModel(title: "Latte", image: R.image.coffeeLoadView())),
                .coffeeItem(vm: ContentContentViewModel(title: "Capuchono", image: R.image.coffeeLoadView())),
                .coffeeItem(vm: ContentContentViewModel(title: "Mate", image: R.image.coffeeLoadView())),
                .coffeeItem(vm: ContentContentViewModel(title: "Tea", image: R.image.coffeeLoadView())),
                .coffeeItem(vm: ContentContentViewModel(title: "Bumble", image: R.image.coffeeLoadView())),
            ])
        ]
        
        sections.accept(items)
    }
}


//ContentContentViewModel(title: "Latte", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Capuchono", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Mate", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Tea", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Bumble", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Espresso Tonic", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Capuchono", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Tea", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Bumble", image: R.image.coffeeLoadView()),
//ContentContentViewModel(title: "Latte", image: R.image.coffeeLoadView()
