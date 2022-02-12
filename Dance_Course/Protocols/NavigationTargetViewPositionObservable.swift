//
//  NavigationTargetViewPositionObservable.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

import UIKit
import RxRelay

protocol TitleObservableDelegate: AnyObject {
    func onTitleVisibilityChanged(isVisible: Bool)
}

protocol NavigationTargetViewPositionObservable {
    var viewPositionObservable: BehaviorRelay<UIView>? { get set }
    var titleObservableDelegate: TitleObservableDelegate? { get set }
}
