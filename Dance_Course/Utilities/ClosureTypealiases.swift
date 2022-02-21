//
//  ClosureTypealiases.swift
//  Dance_Course
//
//  Created by Артем Калинин on 08.02.2022.
//

import UIKit

typealias Action = () -> Void

typealias CompletionAction = (Action?) -> Void

typealias SearchAction = (Action?) -> Void

typealias IndexAction = (Int) -> Void

typealias FloatAction = (CGFloat) -> Void

typealias IntArrayAction = ([Int]) -> Void

typealias BoolAction = (Bool) -> Void

typealias BoolStringAction = (Bool, String?) -> Void

typealias BoolStringStringAction = (Bool, String?, String?) -> Void

typealias ImageAction = (UIImage?) -> Void

typealias InsertTextBlock = (String) -> Void

typealias InsertText2Block = (String, String) -> Void

typealias InsertText3Block = (String, String, String) -> Void

typealias SelectedURLBlock = (URL) -> Void

typealias SearchNavigationViewCallback = (_ string: String) -> Void

typealias DrinksTypeAction = (DrinksType) -> Void

// API

typealias Failure = (Error?) -> Void
