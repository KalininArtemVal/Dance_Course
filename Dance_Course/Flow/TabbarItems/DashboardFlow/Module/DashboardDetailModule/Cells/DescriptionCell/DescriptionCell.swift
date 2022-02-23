//
//  DescriptionCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 22.02.2022.
//


import UIKit
import RxRelay
import RxSwift

class DescriptionCellViewModel {
    
    let description: String?
    
    init(description: String?) {
        self.description = description
    }
}


class DescriptionCell: UITableViewCell {
    
    static let identifier = "DescriptionCell"
    
    // MARK: -  Private properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = .sizeFont
        label.textColor = .whiteColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .descriptionFont
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    
    func configure(with viewModel: DescriptionCellViewModel) {
        descriptionLabel.text = viewModel.description
    }
    
    // MARK: - Private properties
    
    private func setupConstraints() {
        contentView.backgroundColor = .blackColor
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
}
