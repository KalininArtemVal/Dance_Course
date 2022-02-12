//
//  ModalNavigationBar.swift
//  Dance_Course
//
//  Created by Артем Калинин on 09.02.2022.
//

import UIKit

protocol ModalNavigationBarInput {
    var viewModel: ModalNavigationBarViewModel! { get set }
}

protocol ModalNavigationBarOutput {
    var onLeft: Action? { get set }
    var onRight: Action? { get set }
}

class ModalNavigationBar: PrimaryView, ModalNavigationBarInput, ModalNavigationBarOutput {
  
    // MARK: - Input
    var viewModel: ModalNavigationBarViewModel!
    
    // MARK: - Public property
    var onLeft: Action?
    var onRight: Action?
    
    // MARK: - Outlets
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rightButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @IBOutlet weak var rightButtonWidthConstraint: NSLayoutConstraint!
    
    // MARK: - Life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Private methods
    
    
    // MARK: - Public methods
    func setupUI() {
        titleLabel.text = viewModel.title
        
        var rightButtonHidded = false
        var leftButtonImage = #imageLiteral(resourceName: "closeIcon")
        let rightButtonImage = #imageLiteral(resourceName: "basket")
        switch viewModel.style {
        case .backStyle:
            rightButtonHidded = true
            leftButtonImage = #imageLiteral(resourceName: "backIcon")
        case .doneStyle:
//            rightButton.applyTextNavButtonDesign(title: R.string.localizable.navigationDoneButtonTitle().localized)
            rightButtonWidthConstraint.constant = 70.0
        case .doneWithBackStyle:
            leftButtonImage = #imageLiteral(resourceName: "backIcon")
//            rightButton.applyTextNavButtonDesign(title: R.string.localizable.navigationDoneButtonTitle().localized)
            rightButtonWidthConstraint.constant = 70.0
        case .closeWithoutRightStyle:
            rightButtonHidded = true
        default:
            rightButton.setImage(rightButtonImage, for: .normal)
        }
        
        rightButton.isHidden = rightButtonHidded
        leftButton.setImage(leftButtonImage, for: .normal)
        
    }
    
    // MARK: - Action
    @IBAction func leftButtonPressed(_ sender: Any) {
        onLeft?()
    }
    
    @IBAction func rightButtonPressed(_ sender: Any) {
        onRight?()
    }
}
