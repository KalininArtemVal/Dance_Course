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
                                                        image: R.image.latteImage())),
                .coffeeItem(vm: ContentContentViewModel(title: "Capuchono",
                                                        image: R.image.coffeeLoadView())),
                .coffeeItem(vm: ContentContentViewModel(title: "Americano",
                                                        image: R.image.americanoImage())),
                .coffeeItem(vm: ContentContentViewModel(title: "Tea",
                                                        image: R.image.teaImage())),
                .coffeeItem(vm: ContentContentViewModel(title: "Bumble",
                                                        image: R.image.bumbleImage())),
                .coffeeItem(vm: ContentContentViewModel(title: "Espresso",
                                                        image: R.image.espressoImage())),
            ])
        ]
        
        sections.accept(items)
    }
}
