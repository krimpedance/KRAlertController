//
//  UIApplication+topViewController.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  UILabel extension for KRAlertController
 */
extension UILabel {
    func configureLayout(frame: CGRect, text: String?, controllerType: KRAlertControllerType, labelStyle: KRAlertLabelStyle) {
        numberOfLines = 0
        lineBreakMode = .ByWordWrapping
        textAlignment = .Center
        backgroundColor = .clearColor()

        switch labelStyle {
        case .Title:
            textColor = controllerType.textColor
            font = UIFont.systemFontOfSize(20, weight: UIFontWeightBold)
        case .Message:
            font = UIFont.systemFontOfSize(15)
        }

        self.frame = frame
        self.text = text
        sizeToFit()
        self.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: self.frame.height))
    }
}


/**
 *  UIApplication extension for get visible view controller
 */
extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            guard let selected = tab.selectedViewController else { return base }
            return topViewController(selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}