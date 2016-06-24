//
//  UIViewExtension.swift
//  KRAlertControllerDemo
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth :CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor :UIColor {
        get {
            return (layer.borderColor != nil) ? UIColor(CGColor: layer.borderColor!) : UIColor.whiteColor()
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
}