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
    
//    private var maskedGradientBackgroundView: GradientView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    func configureUI() {}
}
