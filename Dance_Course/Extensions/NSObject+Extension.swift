//
//  NSObject+Extension.swift
//  Dance_Course
//
//  Created by Артем Калинин on 11.02.2022.
//

import Foundation
import UIKit

extension NSObject {
    // swiftlint:disable missing_docs
    public class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    // swiftlint:disable missing_docs
    public var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }

    static var nibName: String {
        return String(describing: self)
    }

}
