//
//  HeaderCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 22.02.2022.
//

import UIKit
import RxRelay
import RxSwift

class HeaderCellViewModel {
    let title: String?
    let price: String?
    let image: UIImage?
    let conditionType: ConditionType?
    
    init(title: String?, price: String?, image: UIImage?, conditionType: ConditionType?) {
        self.title = title
        self.price = price
        self.image = image
        self.conditionType = conditionType
    }
}


class HeaderCell: UITableViewCell {
    
    static let identifier = "HeaderCell"
    
    // MARK: -  Private properties
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .headerFont
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .priceFont
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let blurView: UIView = {
        let view = UIView()
        view.tag = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        view.layer.masksToBounds = true
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        return view
    }()
    
    private let conditionTypeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let conditionTypeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        view.backgroundColor = .orangeColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    func configure(with viewModel: HeaderCellViewModel) {
        headerImageView.image = viewModel.image 
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        setConditionImage(with: viewModel.conditionType ?? .hot)
    }
    
    // MARK: - Private properties
    
    private func setConditionImage(with type: ConditionType) {
        switch type {
        case .cold:
            conditionTypeImage.image = R.image.coldDrinksIcon_1()
        case .hot:
            conditionTypeImage.image = R.image.hotDrinksIcon_1()
        }
    }
    
    private func setupConstraints() {
        contentView.addSubview(headerImageView)
        contentView.addSubview(blurView)
        blurView.addSubview(titleLabel)
        blurView.addSubview(priceLabel)
        blurView.addSubview(conditionTypeView)
        conditionTypeView.addSubview(conditionTypeImage)
        contentView.backgroundColor = .blackColor
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalToConstant: 110),
            blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: blurView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: conditionTypeView.leadingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: conditionTypeView.leadingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            conditionTypeView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            conditionTypeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            conditionTypeView.heightAnchor.constraint(equalToConstant: 40),
            conditionTypeView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            conditionTypeImage.centerYAnchor.constraint(equalTo: conditionTypeView.centerYAnchor),
            conditionTypeImage.centerXAnchor.constraint(equalTo: conditionTypeView.centerXAnchor),
            conditionTypeImage.heightAnchor.constraint(equalToConstant: 25),
            conditionTypeImage.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
}
