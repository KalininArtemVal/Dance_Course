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
                .coffeeItem(vm: ContentContentViewModel(title: "Latte",
                                                        image: R.image.latteImage(),
                                                        price: "$4.99",
                                                        description: "with milk and espresso")),
                .coffeeItem(vm: ContentContentViewModel(title: "Capuchono",
                                                        image: R.image.coffeeLoadView(),
                                                        price: "$4.99",
                                                        description: "with espresso and milk")),
                .coffeeItem(vm: ContentContentViewModel(title: "Americano",
                                                        image: R.image.americanoImage(),
                                                        price: "$2.99",
                                                        description: "Fresh espresso")),
                .coffeeItem(vm: ContentContentViewModel(title: "Tea",
                                                        image: R.image.teaImage(),
                                                        price: "$1.99",
                                                        description: "Perfect tea with fruite")),
                .coffeeItem(vm: ContentContentViewModel(title: "Bumble",
                                                        image: R.image.bumbleImage(),
                                                        price: "$3.99",
                                                        description: "Fresh orange jucie")),
                .coffeeItem(vm: ContentContentViewModel(title: "Espresso",
                                                        image: R.image.espressoImage(),
                                                        price: "$1.99",
                                                        description: "with Arabick")),
            ])
        ]
        
        sections.accept(items)
    }
}
