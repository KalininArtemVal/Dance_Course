//
//  SliderMenuItemCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 20.02.2022.
//

import UIKit

class SliderMenuItemViewModel {
    
    var title: String?
    var drinksType: DrinksType
    
    init(title: String?, drinksType: DrinksType) {
        self.title = title
        self.drinksType = drinksType
    }
}

class SliderMenuItemCell: UICollectionViewCell {
    
    static let identifier = "SliderMenuItemCell"
    
    override var isSelected: Bool {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.selectedCircle.backgroundColor = self.isSelected ? UIColor.orangeColor : .clear
                self.titleLabel.textColor = self.isSelected ? UIColor.orangeColor : .whiteColor
            }
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .menuSliderFont
        label.textColor = .whiteColor
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let selectedCircle: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 2.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
//        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func configure(vm: SliderMenuItemViewModel) {
        titleLabel.text = vm.title
    }
    
    // MARK: - Private methods
    
    private func addGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnTitle))
        isUserInteractionEnabled = true
        addGestureRecognizer(gestureRecognizer)
    }
    
    private func setupConstraints() {
        backgroundColor = .black
        contentView.addSubview(titleLabel)
        contentView.addSubview(selectedCircle)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            selectedCircle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            selectedCircle.widthAnchor.constraint(equalToConstant: 5),
            selectedCircle.heightAnchor.constraint(equalToConstant: 5),
            selectedCircle.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
    
    @objc private func tapOnTitle() {
//        print(titleLabel.text)
    }
    
}
