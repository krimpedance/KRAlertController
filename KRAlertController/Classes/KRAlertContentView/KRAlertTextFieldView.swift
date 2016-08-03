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
    var type = KRAlertControllerType.Normal
}


/**
 *  Actions -------------
 */
extension KRAlertTextFieldView {
    func configureLayout(frame: CGRect, textFields: [KRAlertTextField], controllerType: KRAlertControllerType) {
        self.frame = frame

        type = controllerType
        backgroundColor = .clearColor()
        layer.borderWidth = 1
        layer.borderColor = type.buttonBackgroundColor.CGColor

        textFields.enumerate().forEach { index, textField in
            let frame = CGRect(
                origin: CGPoint(x: 0, y: CGFloat(index)*(textFieldHeight+borderViewHeight)),
                size: CGSize(width: frame.width, height: textFieldHeight)
            )
            textField.resetLayout(frame)
            addSubview(textField)

            if textFields.count == index+1 { return }
            let borderView = createBorderView(CGPoint(x: 0, y: frame.origin.y+frame.height))
            addSubview(borderView)
        }
    }

    func createBorderView(point: CGPoint) -> UIView {
        let view = UIView(frame: CGRect(origin: point, size: CGSize(width: bounds.width, height: 1)))
        view.backgroundColor = type.buttonBackgroundColor
        return view
    }
}
