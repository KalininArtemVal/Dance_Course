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
                .menuItem(vm: SliderMenuItemViewModel(title: "SliderMenuItem.Label.All.Text".localized,
                                                      drinksType: .all)),
                .menuItem(vm: SliderMenuItemViewModel(title: "SliderMenuItem.Label.Coffee.Text".localized,
                                                      drinksType: .coffee)),
                .menuItem(vm: SliderMenuItemViewModel(title: "SliderMenuItem.Label.Tea.Text".localized,
                                                      drinksType: .tea)),
                .menuItem(vm: SliderMenuItemViewModel(title: "SliderMenuItem.Label.Deserts.Text".localized,
                                                      drinksType: .deserts)),
                .menuItem(vm: SliderMenuItemViewModel(title: "SliderMenuItem.Label.Fresh.Text".localized,
                                                      drinksType: .freshDrinks))
            ])
        ]
        
        sections.accept(items)
    }
    
}
