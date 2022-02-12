//
//  BaseNavigationBar.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

import UIKit
import RxRelay
import RxSwift

class BaseNavigationView: PrimaryView, CustomNavigationView, NavigationButtonStateObservable {
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Тайтл"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Лево", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Право", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var isShowBackButton: Bool = false {
        didSet {
            leftButton.isHidden = !isShowBackButton
        }
    }
    
    // MARK: - CustomNavigationView
    
    var actionHandler: NavigationViewHandler?
    
    func updateTitle(_ title: String) {}
    
    // MARK: - NavigationButtonStateObservable
    
    var isEnabledRightButtonRelay: BehaviorRelay<Bool>?
    
    var rightButtonType: NavigationButtonType = .other {
        didSet {
            switch rightButtonType {
            
            case .back:
                leftButton.setTitle("back", for: .normal)
                rightButton.isHidden = true
                leftButton.isHidden = false
            case .close:
                leftButton.setTitle("Close", for: .normal)
                rightButton.isHidden = true
                leftButton.isHidden = false
            case .menu:
                rightButton.isHidden = true
                leftButton.isHidden = true
            case .other:
                rightButton.isHidden = true
                leftButton.isHidden = true
            default:
                rightButton.isHidden = true
                leftButton.isHidden = true
            }
//            firstRightButton.tag = firstTag
//            rightButton.tag = secondTag
//            firstRightButton.isHidden = firstIsHidden
//            rightButton.isHidden = isHidden
//            firstButtonLeadingConstraint.isActive = isActiveFirstButtonLeading
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func buttonPressed(_ sender: NavigationButton) {
        actionHandler?(NavigationButtonType(rawValue: sender.tag) ?? .other)
    }
    
    // MARK: - Private methods
    
    deinit {
        print("BaseNavigationView deinit")
    }
    
    // MARK: - Life cycle

    override func configureUI() {
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(title)
        
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rightButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
