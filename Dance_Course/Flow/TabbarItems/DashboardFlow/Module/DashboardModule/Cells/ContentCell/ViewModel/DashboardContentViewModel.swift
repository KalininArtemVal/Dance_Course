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
        generateItems()
    }
    
    private func generateItems() {
        contentItems = [
            ContentContentViewModel(title: "Latte",
                                                    image: R.image.latteImage(),
                                                    price: "$4.99",
                                                    description: "with milk and espresso",
                                                    drinksType: .coffee,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Capuchono",
                                                    image: R.image.coffeeLoadView(),
                                                    price: "$4.99",
                                                    description: "with espresso and milk",
                                                    drinksType: .coffee,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Americano",
                                                    image: R.image.americanoImage(),
                                                    price: "$2.99",
                                                    description: "Fresh espresso",
                                                    drinksType: .coffee,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Tea",
                                                    image: R.image.teaImage(),
                                                    price: "$1.99",
                                                    description: "Perfect tea with fruite",
                                                    drinksType: .tea,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Bumble",
                                                    image: R.image.bumbleImage(),
                                                    price: "$3.99",
                                                    description: "Fresh orange jucie",
                                                    drinksType: .coffee,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Espresso",
                                                    image: R.image.espressoImage(),
                                                    price: "$1.99",
                                                    description: "with Arabick",
                                                    drinksType: .coffee,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Three chocollate",
                                                    image: R.image.firstDessertImage(),
                                                    price: "$3.99",
                                                    description: "with Chocolatte",
                                                    drinksType: .deserts,
                                                    conditionType: .cold),
            ContentContentViewModel(title: "Cherry",
                                                    image: R.image.secondDessertImage(),
                                                    price: "$5.99",
                                                    description: "with Cream and cherry",
                                                    drinksType: .deserts,
                                                    conditionType: .cold),
            ContentContentViewModel(title: "Napoleon",
                                                    image: R.image.thirdDessertImage(),
                                                    price: "$6.99",
                                                    description: "with Cream",
                                                    drinksType: .deserts,
                                                    conditionType: .cold),
            ContentContentViewModel(title: "Mint Tea",
                                                    image: R.image.mintTeaImage(),
                                                    price: "$6.99",
                                                    description: "Tea with Mint",
                                                    drinksType: .tea,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Green Tea",
                                                    image: R.image.greenTeaImage(),
                                                    price: "$6.99",
                                                    description: "tea with ice",
                                                    drinksType: .tea,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Sea-Buckthorn Tea",
                                                    image: R.image.seaBuckthornTeaImage(),
                                                    price: "$6.99",
                                                    description: "with Sea-Buckthorn",
                                                    drinksType: .tea,
                                                    conditionType: .hot),
            ContentContentViewModel(title: "Pineapple lemonade",
                                                    image: R.image.pinappleLemonadeImage(),
                                                    price: "$6.99",
                                                    description: "lemonade with Pineapple",
                                                    drinksType: .freshDrinks,
                                                    conditionType: .cold),
            ContentContentViewModel(title: "Espresso tonic",
                                                    image: R.image.espressoTonicImage(),
                                                    price: "$6.99",
                                                    description: "with espresso and tonic",
                                                    drinksType: .freshDrinks,
                                                    conditionType: .cold),
            ContentContentViewModel(title: "Raf coffee",
                                                    image: R.image.raffCoffeeImage(),
                                                    price: "$4.99",
                                                    description: "with espresso and tonic",
                                                    drinksType: .coffee,
                                                    conditionType: .hot)
        ]
    }

}
