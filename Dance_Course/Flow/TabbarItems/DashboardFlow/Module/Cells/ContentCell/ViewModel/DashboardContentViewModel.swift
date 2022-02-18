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
    
    var coffeeItems: [ContentContentViewModel]
    var sections = BehaviorRelay<[ContentSectionModel]>(value: [])
    
    init(coffeeItems: [ContentContentViewModel]) {
        self.coffeeItems = coffeeItems
    }
    
    func generateSection(coffeeItems: [ContentContentViewModel]) -> [ContentSectionModel] {
        
        let items: [ContentSectionModel] = [
            .mainSection(items: [
                .coffeeItem(vm: coffeeItems)
            ])
        ]
        
        return items
    }
}
