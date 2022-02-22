//
//  DashboardDetailSectionModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 22.02.2022.
//

import RxSwift
import RxDataSources
import Foundation

enum DashboardDetailSectionModel {
    case mainSection(items: [DashboardDetailItem])
}

extension DashboardDetailSectionModel: SectionModelType {
    typealias Item = DashboardDetailItem
   
    var items: [DashboardDetailItem] {
        switch  self {
        case .mainSection(let items):
            return items.map {$0}
        }
    }
    
    init(original: DashboardDetailSectionModel, items: [DashboardDetailItem]) {
        switch original {
        case let .mainSection(items): self = .mainSection(items: items)
        }
    }
}

enum DashboardDetailItem {
    case headerItem(vm: HeaderCellViewModel)
    case descriptionItem(vm: DescriptionCellViewModel)
    case sizeItem
//    case basket
}
