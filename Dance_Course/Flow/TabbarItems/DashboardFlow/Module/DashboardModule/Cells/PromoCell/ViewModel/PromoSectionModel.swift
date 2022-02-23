//
//  PromoSectionModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 23.02.2022.
//

import RxSwift
import RxDataSources
import Foundation

enum PromoSectionModel {
    case mainSection(items: [PromoItem])
}

extension PromoSectionModel: SectionModelType {
    typealias Item = PromoItem
   
    var items: [PromoItem] {
        switch  self {
        case .mainSection(let items):
            return items.map {$0}
        }
    }
    
    init(original: PromoSectionModel, items: [PromoItem]) {
        switch original {
        case let .mainSection(items): self = .mainSection(items: items)
        }
    }
}

enum PromoItem {
    case promoItem(vm: PromoItemViewModel)
}
