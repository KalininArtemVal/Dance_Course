//
//  DashboardDetailNavigationView.swift
//  Dance_Course
//
//  Created by Артем Калинин on 22.02.2022.
//

import RxRelay
import Foundation

class DashboardDetailNavigationView: PrimaryView, CustomNavigationView  {
    
    @IBOutlet weak var title: UILabel! {
        didSet {
            title.text = ""
        }
    }
    @IBOutlet weak var leftButton: UIButton!
    
    var actionHandler: NavigationViewHandler?
    
    func updateTitle(_ title: String) {
        self.title.text = title
    }
    
    
    @IBAction func leftButtonAction(_ sender: Any) {
        actionHandler?(.back)
    }
    
}
