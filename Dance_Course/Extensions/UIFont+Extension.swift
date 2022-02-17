//
//  UIFont+Extension.swift
//  Dance_Course
//
//  Created by Артем Калинин on 17.02.2022.
//
import Rswift
import Foundation

extension UIFont {
    static var headerFont: UIFont {
        let size: CGFloat = UIDevice().isSmallScreen ? 22 : 28
        return UIFont.init(name: "SFProDisplay-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }

    static var textFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
    }

//    static var cameraFont: UIFont {
//        return R.font.sfProTextRegular(size: 13) ?? UIFont.systemFont(ofSize: 13)
//    }

    static var subtextFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Thin", size: 10) ?? UIFont.systemFont(ofSize: 10)
    }

    // right now using default tabbar item font
    static var tabbarFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Medium", size: 9) ?? UIFont.systemFont(ofSize: 9)
    }
}
