//
//  ContentSectionModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 18.02.2022.
//

import RxSwift
import RxDataSources
import Foundation

enum ContentSectionModel {
    case mainSection(items: [ContentItem])
}

extension ContentSectionModel: SectionModelType {
    typealias Item = ContentItem
   
    var items: [ContentItem] {
        switch  self {
        case .mainSection(let items):
            return items.map {$0}
        }
    }
    
    init(original: ContentSectionModel, items: [ContentItem]) {
        switch original {
        case let .mainSection(items): self = .mainSection(items: items)
        }
    }
}

enum ContentItem {
    case coffeeItem(vm: [ContentContentViewModel])
}
