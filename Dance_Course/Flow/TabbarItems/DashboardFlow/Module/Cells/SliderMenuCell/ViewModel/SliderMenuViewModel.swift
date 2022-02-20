//
//  SliderMenuViewModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 20.02.2022.
//

import RxSwift
import RxDataSources
import RxRelay
import UIKit

class SliderMenuViewModel {
    
    var sections = BehaviorRelay<[SliderMenuSectionModel]>(value: [])
    
    init() {
        generateSection()
    }
    
    func generateSection() {
        let items: [SliderMenuSectionModel] = [
            .mainSection(items: [
                .menuItem(vm: SliderMenuItemViewModel(title: "Coffee")),
                .menuItem(vm: SliderMenuItemViewModel(title: "Tea")),
                .menuItem(vm: SliderMenuItemViewModel(title: "Dessert")),
                .menuItem(vm: SliderMenuItemViewModel(title: "Fresh drinks"))
            ])
        ]
        
        sections.accept(items)
    }
}
