//
//  BaseNavigationBar.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

import UIKit
import RxRelay
import RxSwift

class BaseNavigationView: PrimaryView, CustomNavigationView {
    
    // MARK: - CustomNavigationView
    
    var title: String = ""
    
    var actionHandler: NavigationViewHandler?
    
    func enableButtons(with tags: [Int], enable: Bool) {}
    
    // MARK: - Actions
    
    @IBAction private func buttonPressed(_ sender: NavigationButton) {
        actionHandler?(NavigationButtonType(rawValue: sender.tag) ?? .other)
    }
    
    // MARK: - Private properties
    
    // Utility `DisposeBag` used by the subclasses.
    
    let disposeBag = DisposeBag()
    
    // MARK: - Private methods
    
    func updateTitle(_ title: String) {
        self.title = title
    }
    
    deinit {
        print("\(self.nameOfClass) deinit")
    }
}
