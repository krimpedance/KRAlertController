//
//  KRAlertTextFieldView.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  KRAlertTextFieldView
 */
class KRAlertTextFieldView: UIView {
    let textFieldHeight: CGFloat = 30
    let borderViewHeight: CGFloat = 1
}


/**
 *  Actions -------------
 */
extension KRAlertTextFieldView {
    func configureLayout(frame: CGRect, textFields: [UITextField], controllerType type: KRAlertControllerType) {
        self.frame = frame
        backgroundColor = .clearColor()
        layer.borderWidth = 1
        layer.borderColor = type.buttonBackgroundColor.CGColor

        textFields.enumerate().forEach { index, textField in
            let frame = CGRect(
                origin: CGPoint(x: 0, y: CGFloat(index)*(textFieldHeight+borderViewHeight)),
                size: CGSize(width: frame.width, height: textFieldHeight)
            )
            textField.configureLayout(frame, type: type)
            textField.delegate = textField.delegate ?? self
            addSubview(textField)

            if textFields.count == index+1 { return }
            let point = CGPoint(x: 0, y: frame.origin.y+frame.height)
            let size = CGSize(width: bounds.width, height: 1)
            let borderView = UIView(frame: CGRect(origin: point, size: size))
            borderView.backgroundColor = type.buttonBackgroundColor
            addSubview(borderView)
        }
    }
}


/**
 *  UITextField delegate --------------------
 */
extension KRAlertTextFieldView: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
