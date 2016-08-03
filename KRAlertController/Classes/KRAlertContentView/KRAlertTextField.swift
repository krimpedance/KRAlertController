//
//  KRAlertTextField.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//
// swiftlint:disable legacy_constant

import UIKit

/**
 *  KRAlerTextField
 */
class KRAlertTextField: UITextField {

    let padding: CGFloat = 5
    var type = KRAlertControllerType.Normal

    convenience init(type: KRAlertControllerType) {
        self.init()
        self.type = type
        initialLayout()
    }
}


/**
 *  Actions ----------
 */
extension KRAlertTextField {
    func initialLayout() {
        self.delegate = self
        resetLayout(CGRectZero)
        leftViewMode = .Always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: padding))
    }

    func resetLayout(frame: CGRect) {
        self.frame = frame
        layer.borderColor = UIColor.clearColor().CGColor
        layer.borderWidth = 0
        font = UIFont.systemFontOfSize(15)
        textColor = type.textColor
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSForegroundColorAttributeName: type.buttonBackgroundColor]
        )
    }
}


/**
 *  UITextField delegate ----------
 */
extension KRAlertTextField: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
