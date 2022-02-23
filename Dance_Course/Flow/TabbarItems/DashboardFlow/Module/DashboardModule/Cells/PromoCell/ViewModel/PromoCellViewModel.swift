//
//  PromoCellViewModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 23.02.2022.
//

import RxSwift
import RxDataSources
import RxRelay
import UIKit


class PromoCellViewModel {
    
    var sections = BehaviorRelay<[PromoSectionModel]>(value: [])
    
    init() {
        displayItems()
    }
    
    func displayItems() {
        sections.accept(generateSection())
    }
    
    private func generateSection() -> [PromoSectionModel] {
        let items: [PromoSectionModel] = [
            .mainSection(items: [
                .promoItem(vm: PromoItemViewModel(title: "День защитника отечества",
                                                  image: R.image.espressoImage(),
                                                  description: "Горячим порням - остужающие напитки с 20% скидкой"))
            ])
        ]
        return items
    }
}
