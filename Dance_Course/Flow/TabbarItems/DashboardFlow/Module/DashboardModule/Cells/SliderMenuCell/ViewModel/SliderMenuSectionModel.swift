//
//  SliderMenuSectionModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 20.02.2022.
//

import RxSwift
import RxDataSources
import Foundation

enum SliderMenuSectionModel {
    case mainSection(items: [SliderMenuItem])
}

extension SliderMenuSectionModel: SectionModelType {
    typealias Item = SliderMenuItem
   
    var items: [SliderMenuItem] {
        switch  self {
        case .mainSection(let items):
            return items.map {$0}
        }
    }
    
    init(original: SliderMenuSectionModel, items: [SliderMenuItem]) {
        switch original {
        case let .mainSection(items): self = .mainSection(items: items)
        }
    }
}

enum SliderMenuItem {
    case menuItem(vm: SliderMenuItemViewModel)
}
