//
//  TitleTableViewCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 17.02.2022.
//

import UIKit
import RxRelay
import RxSwift


class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    // MARK: -  Private properties
    
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.font = .headerFont
        label.text = "TitleCell.Label.Main.Text".localized
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
    
    private func setupConstraints() {
        contentView.addSubview(mainTitle)
        contentView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
}
