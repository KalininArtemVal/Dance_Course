//
//  TabbarCell.swift
//  Dance_Course
//
//  Created by Артем Калинин on 10.02.2022.
//

import UIKit

final class AppTabBarCell: UICollectionViewCell {
    
    //MARK: - Properties
    var isLeft = false {
        didSet {
            setConstraints()
        }
    }
    
    var iconImage: AppTabBarCellData? {
        didSet {
            setChosenView(isSelected: isSelected)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.setChosenView(isSelected: self.isSelected)
            }
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Views
    private let icon: UIView = {
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    
    //MARK: - Methods
    public func setChosenView(isSelected: Bool) {
        guard let iconImage = iconImage else { return }
        if self.isSelected {
            icon.backgroundColor = iconImage.selectedIcon
        } else {
            icon.backgroundColor = iconImage.unselectedIcon
        }
    }
    
    private func setConstraints() {
        contentView.addSubview(icon)
                
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 23),
            icon.heightAnchor.constraint(equalToConstant: 23),
        ])
        
        var horizontalOffset: CGFloat = 100.fitW
        if isLeft {
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalOffset).isActive = true
        } else {
            horizontalOffset *= -1
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: horizontalOffset).isActive = true
        }
    }
    
}
