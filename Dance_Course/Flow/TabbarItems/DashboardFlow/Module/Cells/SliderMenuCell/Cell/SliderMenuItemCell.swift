//
//  SliderMenuItemCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 20.02.2022.
//

import UIKit

class SliderMenuItemViewModel {
    
    var title: String?
    
    init(title: String?) {
        self.title = title
    }
}

class SliderMenuItemCell: UICollectionViewCell {
    
    static let identifier = "SliderMenuItemCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .menuSliderFont
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    func configure(vm: SliderMenuItemViewModel) {
        titleLabel.text = vm.title
    }
    
    private func setupConstraints() {
        backgroundColor = .black
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
}
