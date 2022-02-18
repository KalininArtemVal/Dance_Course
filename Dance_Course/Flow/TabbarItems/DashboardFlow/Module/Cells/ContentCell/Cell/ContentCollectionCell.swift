//
//  ContentCollectionCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 17.02.2022.
//

import UIKit

class ContentContentViewModel {
    
    var title: String?
    var image: UIImage?
    
    init(title: String?, image: UIImage?) {
        self.image = image
        self.title = title
    }
}

class ContentCollectionCell: UICollectionViewCell {
    
    static let identifier = "ContentCollectionCell"
    
    // MARK: - Private properties
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    }
    // MARK: - Private properties
    
    private func setupConstraints() {
        backgroundColor = .black
        layer.cornerRadius = 16
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
}
