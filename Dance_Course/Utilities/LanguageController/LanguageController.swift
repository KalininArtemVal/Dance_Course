//
//  LanguageController.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//
import UIKit

enum LangCodes {
    static let rus = "ru"
    static let eng = "en"
}

private enum LocalizationKeys {
    static let languageCode = "LANG_CODE"
    static let localizedDictionary = "keysDict"
}

final class LanguageController {
    static let sharedInstance = LanguageController()
    static let kNotifLanguageChanged = "kNotifLanguageChanged"
    private var localeDictionary: [String: String] = [:]
    
    var activeLocaleLang = Locale.init(identifier: "ru_RU")
    var activeLang: String = LangCodes.rus {
        didSet {
            activeLocaleLang = Locale.init(identifier: "\(activeLang.lowercased())_\(activeLang.uppercased())")
        }
    }
    
    private init() {
        let path = Bundle.main.path(forResource: "Localizable", ofType: "strings", inDirectory: nil, forLocalization: activeLang)
        if let path = path, let dict = NSDictionary(contentsOfFile: path) as? [String: String] {
            localeDictionary = dict
        }
    }
    
    func localizedString(for key: String?) -> String {
        
        guard let key = key else {
            return ""
        }
        
        if key == "" {
            return ""
        }
        
        if let value  = localeDictionary[key] {
            return value
        }
        
        return NSLocalizedString(key, comment: "")
    }
}

extension String {
    var localized: String {
        return LanguageController.sharedInstance.localizedString(for: self)
    }
}
