//
//  SizeItemCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 23.02.2022.
//

import UIKit

class SizeItemCell: UICollectionViewCell {
    
    static let identifier = "SizeItemCell"
    
    // MARK: - Private properties
    
    override var isSelected: Bool {
        didSet {
            mainView.layer.borderColor = !isSelected ? UIColor.black.withAlphaComponent(0.1).cgColor : UIColor.orangeColor.cgColor
        }
    }
    
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        view.backgroundColor = .blackColor.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.font = .sizeFont
        label.textColor = .whiteColor
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
    
    // MARK: - Public methods
    
    func configure(with title: String) {
        sizeLabel.text = title
    }
    
    // MARK: - Private methods
    
    private func setupConstraints() {
        contentView.addSubview(mainView)
        mainView.addSubview(sizeLabel)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            sizeLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            sizeLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        ])
    }
}
