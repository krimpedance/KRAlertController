//
//  KRAlertButton.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  KRAlertButton
 */
class KRAlertButton: UIButton {
    var alertAction: KRAlertAction
    var type: KRAlertControllerType

    init(frame: CGRect, action: KRAlertAction, type: KRAlertControllerType) {
        self.alertAction = action
        self.type = type
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/**
 *  Actions --------------------
 */
extension KRAlertButton {
    func setup() {
        layer.cornerRadius = 5.0
        setTitle(alertAction.title, for: .normal)
        setTitleColor(type.textColor, for: .normal)
        setTitleColor(type.iconColor, for: .highlighted)
        backgroundColor = type.buttonBackgroundColor

        let weight: UIFont.Weight = alertAction.isPreferred ? .bold : .regular
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: weight)
    }
}
