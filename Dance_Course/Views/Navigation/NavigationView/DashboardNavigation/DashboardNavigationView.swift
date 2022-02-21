//
//  PlainNavigationView.swift
//  Dance_Course
//
//  Created by Артем Калинин on 13.02.2022.
//
import RxRelay
import Foundation

class DashboardNavigationView: PrimaryView, CustomNavigationView  {
    
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
        actionHandler?(.menu)
    }
    
}
