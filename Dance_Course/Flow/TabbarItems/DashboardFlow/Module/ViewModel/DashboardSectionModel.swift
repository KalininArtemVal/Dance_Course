//
//  DashboardSectionModel.swift
//  Dance_Course
//
//  Created by Артем Калинин on 17.02.2022.
//
import RxSwift
import RxDataSources
import Foundation

enum DashboardSectionModel {
    case mainSection(items: [DashboardItem])
}

extension DashboardSectionModel: SectionModelType {
    typealias Item = DashboardItem
   
    var items: [DashboardItem] {
        switch  self {
        case .mainSection(let items):
            return items.map {$0}
        }
    }
    
    init(original: DashboardSectionModel, items: [DashboardItem]) {
        switch original {
        case let .mainSection(items): self = .mainSection(items: items)
        }
    }
}

enum DashboardItem {
    case headerItem
    case contentItem(vm: [ContentContentViewModel])
}
