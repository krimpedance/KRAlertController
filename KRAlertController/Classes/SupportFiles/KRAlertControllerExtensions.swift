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
        lineBreakMode = .byWordWrapping
        textAlignment = .center
        backgroundColor = .clear

        switch labelStyle {
        case .title:
            textColor = controllerType.textColor
            font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightBold)
        case .message:
            font = UIFont.systemFont(ofSize: 15)
        }

        self.frame = frame
        self.text = text
        sizeToFit()
        self.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: self.frame.height))
    }
}


/**
 *  UITextField extension for KRAlertController
 */
extension UITextField {
    func configureLayout(frame: CGRect, type: KRAlertControllerType) {
        self.frame = frame
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
        font = UIFont.systemFont(ofSize: 15)
        textColor = type.textColor
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSForegroundColorAttributeName: type.buttonBackgroundColor]
        )
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
    }
}


/**
 *  UIApplication extension for get visible view controller
 */
extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
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
