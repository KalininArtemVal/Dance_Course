//
//  DashboardDetailViewModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 22.02.2022.
//

import RxSwift
import RxDataSources
import RxRelay
import UIKit

class DashboardDetailViewModel {
    
    var contentItem: ContentContentViewModel?
    var sections = BehaviorRelay<[DashboardDetailSectionModel]>(value: [])
    
    init(contentItem: ContentContentViewModel) {
        self.contentItem = contentItem
        displayItems()
    }
    
    func displayItems() {
        sections.accept(generateSection())
    }
    
    private func generateSection() -> [DashboardDetailSectionModel] {
        let items: [DashboardDetailSectionModel] = [
            .mainSection(items: [
                .headerItem(vm: HeaderCellViewModel(title: contentItem?.title,
                                                    price: contentItem?.price,
                                                    image: contentItem?.image,
                                                    conditionType: contentItem?.conditionType)),
                .description(vm: DescriptionCellViewModel(description: contentItem?.description)),
//                .basket
            ])
        ]
        return items
    }
}
