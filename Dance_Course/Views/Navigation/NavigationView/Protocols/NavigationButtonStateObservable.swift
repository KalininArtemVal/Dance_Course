//
//  NavigationButtonStateObservable.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//
import RxRelay

protocol NavigationButtonStateObservable {
    var isEnabledRightButtonRelay: BehaviorRelay<Bool>? { get set }
}
