//
//  PromoItemCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 23.02.2022.
//

import UIKit



class PromoItemViewModel {
    
    var title: String?
    var image: UIImage?
    var description: String?
    
    init(title: String?, image: UIImage?, description: String?) {
        self.image = image
        self.title = title
        self.description = description
    }
}

class PromoItemCell: UICollectionViewCell {
    
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
    
    func configure(with viewModel: PromoItemViewModel) {
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.description
        
        
    }
    
    // MARK: - Private properties
    
    private func setupConstraints() {
        backgroundColor = .blackColor
        layer.cornerRadius = 7
        contentView.addSubview(imageView)
        imageView.addSubview(gradientView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 150),
            heightAnchor.constraint(equalToConstant: 150),
        ])
        
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
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
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
    
}
