//
//  KRAlertButton.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

class KRAlertButton: UIButton {
    var action: KRAlertAction!
    var type: KRAlertControllerType!
    
    convenience init(frame: CGRect, action: KRAlertAction, type: KRAlertControllerType) {
        self.init(frame: frame)
        self.action = action
        self.type = type
        setup()
    }
}


/**
 *  Actions --------------------
 */
extension KRAlertButton {
    func setup() {
        layer.cornerRadius = 5.0
        setTitle(action.title, forState: .Normal)
        setTitleColor(type.textColor, forState: .Normal)
        setTitleColor(type.iconColor, forState: .Highlighted)
        backgroundColor = type.buttonBackgroundColor
        
        switch action.style {
        case .Default:
            titleLabel?.font = UIFont.systemFontOfSize(17)
        case .Destructive:
            titleLabel?.font = UIFont.systemFontOfSize(17, weight: UIFontWeightBold)
            setTitleColor(.redColor(), forState: .Normal)
        case .Cancel:
            titleLabel?.font = UIFont.systemFontOfSize(17, weight: UIFontWeightBold)
        }
    }
}