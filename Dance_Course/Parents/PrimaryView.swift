//
//  PrimaryView.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import Foundation
import UIKit

protocol NibInitializable {
    var view: UIView! {get set}
}

extension NibInitializable where Self: PrimaryView {

    func nibSetup() {
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
}

class PrimaryView: UIView, NibInitializable {

    var view: UIView! {
        didSet {
            configureUI()
        }
    }
    
    private var maskedGradientBackgroundView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    func configureUI() {}
    
    func setupMaskedGradientBackgroundView(size: CGSize) {
        maskedGradientBackgroundView = UIView()
//        maskedGradientBackgroundView?.colors = [.mainThemeColor, .mainThemeColor]
//        maskedGradientBackgroundView?.direction = .vertical
        maskedGradientBackgroundView?.frame = CGRect(origin: .zero, size: size)
        insertSubview(maskedGradientBackgroundView!, at: 0)
        clipsToBounds = true
    }
    
    func setMaskedGradientBackgroundOffset(point: CGPoint) {
        var frame = maskedGradientBackgroundView?.frame
        frame?.origin = point
        maskedGradientBackgroundView?.frame = CGRect(origin: point, size: maskedGradientBackgroundView?.frame.size ?? .zero)
    }
}
