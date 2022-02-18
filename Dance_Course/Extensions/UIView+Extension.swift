//
//  UIView+Extension.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

extension UIView {

    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func stretchFullOn(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    /// Stretches itself to the size of the view except for the Safe Area
    func stretchFullSafelyOn(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // --- Apply Gradient to View (or button, or something else) with COLOR and START/END Point
    func applyGradientWithStartAndEndPoint(colors: [UIColor], cornerRadius: CGFloat? = nil, isTopToBottom: Bool = false, startTopPoint: CGPoint, endTopPoint: CGPoint, startBottomPoint: CGPoint, endBottomPoint: CGPoint) {
        if let _ = layer.sublayers?.first as? CAGradientLayer {
            layer.sublayers?.first?.removeFromSuperlayer()
        }
            
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }

        if isTopToBottom {
            gradientLayer.startPoint = startTopPoint
            gradientLayer.endPoint = endTopPoint
        } else {
            gradientLayer.startPoint = startBottomPoint
            gradientLayer.endPoint = endBottomPoint
        }
        
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = cornerRadius ?? 0
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    

    // --- Apply Gradient to View (or button, or something else) with COLOR and START/END Point
    func applyGradientWithStartAndEndPointAnimation(startColors: [UIColor], cornerRadius: CGFloat? = nil, isTopToBottom: Bool = false, startTopPoint: CGPoint, endTopPoint: CGPoint, startBottomPoint: CGPoint, endBottomPoint: CGPoint, animationDuration: CFTimeInterval,  endColors: [UIColor]) {
        if let _ = layer.sublayers?.first as? CAGradientLayer {
            layer.sublayers?.first?.removeFromSuperlayer()
        }
            
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = startColors.map { $0.cgColor }

        if isTopToBottom {
            gradientLayer.startPoint = startTopPoint
            gradientLayer.endPoint = endTopPoint
        } else {
            gradientLayer.startPoint = startBottomPoint
            gradientLayer.endPoint = endBottomPoint
        }
        
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = cornerRadius ?? 0
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = animationDuration
        gradientChangeAnimation.toValue = endColors.map { $0.cgColor }
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientLayer.add(gradientChangeAnimation, forKey: "colorChange")
    }
    
}
