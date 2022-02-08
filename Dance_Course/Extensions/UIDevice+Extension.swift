//
//  UIDevice+Extension.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

extension UIDevice {
   
    var iPhone: Bool {
        // swiftlint:disable discouraged_direct_init
        return UIDevice().userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case iPhoneXR
        case iPhoneXSMax
        case iPhone11Pro
        case iPhone12Mini
        case iPhone12Pro
        case iPhone12ProMax
        case unknown
    }
    var screenType: ScreenType {
        guard iPhone else { return .unknown }
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 1792:
            return .iPhoneXR
        case 1920, 2208:
            return .iPhone6Plus
        case 2436:
            return .iPhoneX
        case 2426:
            return .iPhone11Pro
        case 2340:
            return .iPhone12Mini
        case 2532:
            return .iPhone12Pro
        case 2688:
            return .iPhoneXSMax
        case 2778:
            return .iPhone12ProMax
        default:
            return .unknown
        }
    }
    var isXSeriesScreen: Bool {
        return UIDevice().screenType == .iPhoneX ||
                UIDevice().screenType == .iPhoneXR ||
                UIDevice().screenType == .iPhoneXSMax ||
                UIDevice().screenType == .iPhone12Pro ||
                UIDevice().screenType == .iPhone11Pro ||
                UIDevice().screenType == .iPhone12Mini ||
                UIDevice().screenType == .iPhone12ProMax
    }
    var isSmallScreen: Bool {
        return UIDevice.current.screenType == .iPhone5 ||
            UIDevice.current.screenType == .iPhone4
    }
    
    static var id: String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
}

extension UIDevice {
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            return keyWindow?.safeAreaInsets.bottom ?? 0 > 0
        }
        return false
    }

}
