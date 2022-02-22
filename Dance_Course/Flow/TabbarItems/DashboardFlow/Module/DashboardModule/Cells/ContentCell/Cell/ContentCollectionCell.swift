//
//  ContentCollectionCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 17.02.2022.
//

import UIKit

enum DrinksType {
    case all
    case coffee
    case tea
    case deserts
    case freshDrinks
}

enum ConditionType {
    case cold
    case hot
}

class ContentContentViewModel {
    
    var title: String?
    var image: UIImage?
    var price: String?
    var description: String?
    var drinksType: DrinksType
    var conditionType: ConditionType
    
    init(title: String?, image: UIImage?, price: String?, description: String?, drinksType: DrinksType, conditionType: ConditionType) {
        self.image = image
        self.title = title
        self.price = price
        self.description = description
        self.drinksType = drinksType
        self.conditionType = conditionType
    }
}

class ContentCollectionCell: UICollectionViewCell {
    
    static let identifier = "ContentCollectionCell"
    
    // MARK: - Private properties
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .textFont
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .subtextFont
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .priceFont
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    func configure(with viewModel: ContentContentViewModel) {
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.description
        priceLabel.text = viewModel.price
        
        
    }
    
    // MARK: - Private properties
    
    private func setupConstraints() {
        backgroundColor = .blackColor
        layer.cornerRadius = 7
        contentView.addSubview(imageView)
        imageView.addSubview(gradientView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: contentView.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            gradientView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -10),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    override func draw(_ rect: CGRect) {
        gradientView.applyGradientWithStartAndEndPoint(
            colors: [
                .clear,
                .blackColor
            ],
            cornerRadius: 2,
            isTopToBottom: true,
            // --- Left color move to right
            startTopPoint:  CGPoint(x: 1, y: 0),
            endTopPoint: CGPoint(x: 1, y: 1),
            // --- Right color move to left
            startBottomPoint: CGPoint(x: 0, y: 1),
            endBottomPoint: CGPoint(x: 1, y: 1)
        )
    }
    
//    override func prepareForReuse() {
//        if let _ = gradientView.layer.sublayers?.first as? CAGradientLayer {
//            gradientView.layer.sublayers?.first?.removeFromSuperlayer()
//        }
//    }
    
}
