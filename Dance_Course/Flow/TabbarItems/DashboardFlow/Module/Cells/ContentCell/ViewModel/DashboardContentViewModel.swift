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
    
    var contentItems: [ContentContentViewModel] = []
    var filterItems: [ContentContentViewModel] = []
    
    var sections = BehaviorRelay<[ContentSectionModel]>(value: [])
    var items: [ContentSectionModel] = []
    var itemsCount = BehaviorRelay<CGFloat>(value: 0)
    var isItemSelected = BehaviorRelay<Bool>(value: false)
    
    init() {
//        generateSection()
        generateItems()
    }
    
    private func generateItems() {
        contentItems = [
            ContentContentViewModel(title: "Latte",
                                                    image: R.image.latteImage(),
                                                    price: "$4.99",
                                                    description: "with milk and espresso",
                                                    drinksType: .coffee),
            ContentContentViewModel(title: "Capuchono",
                                                    image: R.image.coffeeLoadView(),
                                                    price: "$4.99",
                                                    description: "with espresso and milk",
                                                    drinksType: .coffee),
            ContentContentViewModel(title: "Americano",
                                                    image: R.image.americanoImage(),
                                                    price: "$2.99",
                                                    description: "Fresh espresso",
                                                    drinksType: .coffee),
            ContentContentViewModel(title: "Tea",
                                                    image: R.image.teaImage(),
                                                    price: "$1.99",
                                                    description: "Perfect tea with fruite",
                                                    drinksType: .tea),
            ContentContentViewModel(title: "Bumble",
                                                    image: R.image.bumbleImage(),
                                                    price: "$3.99",
                                                    description: "Fresh orange jucie",
                                                    drinksType: .coffee),
            ContentContentViewModel(title: "Espresso",
                                                    image: R.image.espressoImage(),
                                                    price: "$1.99",
                                                    description: "with Arabick",
                                                    drinksType: .coffee),
            ContentContentViewModel(title: "AAAA",
                                                    image: R.image.espressoImage(),
                                                    price: "$1.99",
                                                    description: "with Arabick",
                                                    drinksType: .deserts),
            ContentContentViewModel(title: "BBBB",
                                                    image: R.image.espressoImage(),
                                                    price: "$1.99",
                                                    description: "with Arabick",
                                                    drinksType: .deserts),
        ]
    }
    
//    func filterItems(with type: DrinksType) {
//        filterItems = contentItems.filter({ (content: ContentContentViewModel) -> Bool in
//            return content.drinksType == type
//        })
//    }
    
    func generateSection() {
        self.items = [
            .mainSection(items: [
                .coffeeItem(vm: ContentContentViewModel(title: "Latte",
                                                        image: R.image.latteImage(),
                                                        price: "$4.99",
                                                        description: "with milk and espresso",
                                                        drinksType: .coffee)),
                .coffeeItem(vm: ContentContentViewModel(title: "Capuchono",
                                                        image: R.image.coffeeLoadView(),
                                                        price: "$4.99",
                                                        description: "with espresso and milk",
                                                        drinksType: .coffee)),
                .coffeeItem(vm: ContentContentViewModel(title: "Americano",
                                                        image: R.image.americanoImage(),
                                                        price: "$2.99",
                                                        description: "Fresh espresso",
                                                        drinksType: .coffee)),
                .coffeeItem(vm: ContentContentViewModel(title: "Tea",
                                                        image: R.image.teaImage(),
                                                        price: "$1.99",
                                                        description: "Perfect tea with fruite",
                                                        drinksType: .tea)),
                .coffeeItem(vm: ContentContentViewModel(title: "Bumble",
                                                        image: R.image.bumbleImage(),
                                                        price: "$3.99",
                                                        description: "Fresh orange jucie",
                                                        drinksType: .coffee)),
                .coffeeItem(vm: ContentContentViewModel(title: "Espresso",
                                                        image: R.image.espressoImage(),
                                                        price: "$1.99",
                                                        description: "with Arabick",
                                                        drinksType: .coffee)),
            ])
        ]
        
        sections.accept(items)
        itemsCount.accept(800)
    }
    
    func setItems(with type: DrinksType) {
        switch type {
        case .all:
            items = [
                .mainSection(items: [
                    .coffeeItem(vm: ContentContentViewModel(title: "Latte",
                                                            image: R.image.latteImage(),
                                                            price: "$4.99",
                                                            description: "with milk and espresso",
                                                            drinksType: .coffee)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Capuchono",
                                                            image: R.image.coffeeLoadView(),
                                                            price: "$4.99",
                                                            description: "with espresso and milk",
                                                            drinksType: .coffee)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Americano",
                                                            image: R.image.americanoImage(),
                                                            price: "$2.99",
                                                            description: "Fresh espresso",
                                                            drinksType: .coffee)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Tea",
                                                            image: R.image.teaImage(),
                                                            price: "$1.99",
                                                            description: "Perfect tea with fruite",
                                                            drinksType: .tea)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Bumble",
                                                            image: R.image.bumbleImage(),
                                                            price: "$3.99",
                                                            description: "Fresh orange jucie",
                                                            drinksType: .coffee)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Espresso",
                                                            image: R.image.espressoImage(),
                                                            price: "$1.99",
                                                            description: "with Arabick",
                                                            drinksType: .coffee)),
                ])
            ]
            itemsCount.accept(800)
        case .coffee:
            items = [
                .mainSection(items: [
                    .coffeeItem(vm: ContentContentViewModel(title: "Latte",
                                                            image: R.image.latteImage(),
                                                            price: "$4.99",
                                                            description: "with milk and espresso",
                                                            drinksType: .coffee)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Capuchono",
                                                            image: R.image.coffeeLoadView(),
                                                            price: "$4.99",
                                                            description: "with espresso and milk",
                                                            drinksType: .coffee)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Americano",
                                                            image: R.image.americanoImage(),
                                                            price: "$2.99",
                                                            description: "Fresh espresso",
                                                            drinksType: .coffee)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Bumble",
                                                            image: R.image.bumbleImage(),
                                                            price: "$3.99",
                                                            description: "Fresh orange jucie",
                                                            drinksType: .coffee)),
                    .coffeeItem(vm: ContentContentViewModel(title: "Espresso",
                                                            image: R.image.espressoImage(),
                                                            price: "$1.99",
                                                            description: "with Arabick",
                                                            drinksType: .coffee)),
                ])
            ]
            itemsCount.accept(800)
        case .tea:
            items = [
                .mainSection(items: [
                    .coffeeItem(vm: ContentContentViewModel(title: "Tea",
                                                            image: R.image.teaImage(),
                                                            price: "$1.99",
                                                            description: "Perfect tea with fruite",
                                                            drinksType: .tea)),
                ])
            ]
            itemsCount.accept(250)
        default:
            items = [
                .mainSection(items: [
                    .coffeeItem(vm: ContentContentViewModel(title: "Tea",
                                                            image: R.image.teaImage(),
                                                            price: "$1.99",
                                                            description: "Perfect tea with fruite",
                                                            drinksType: .tea)),
                ])
            ]
            itemsCount.accept(250)
        }
        sections.accept(items)
    }
    
    
}
