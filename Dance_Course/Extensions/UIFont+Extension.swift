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
        return UIFont.init(name: "SFProDisplay-Semibold", size: 19) ?? UIFont.systemFont(ofSize: 19)
    }
    
    static var sizeFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Light", size: 18) ?? UIFont.systemFont(ofSize: 18)
    }
    
    static var descriptionFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Thin", size: 17) ?? UIFont.systemFont(ofSize: 17)
    }
    
    static var priceFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20)
    }

    static var subtextFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Light", size: 14) ?? UIFont.systemFont(ofSize: 14)
    }
    
    static var menuSliderFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
    }
    
    static var tabbarFont: UIFont {
        return UIFont.init(name: "SFProDisplay-Medium", size: 9) ?? UIFont.systemFont(ofSize: 9)
    }
}
