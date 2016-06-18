//
//  KRAlertView.swift
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit


public enum KRAlertViewStyle {
    case Success, Information, Warning, Error, Edit
}

public enum KRActionType {
    case None, Selector, Closure
}

/**
 *  KRAlertContentView
 */



/**
 *  KRAlertView (Main)
 */
public final class KRAlertView {
    
    // component
    let baseViewController = UIViewController()
   
    let alertView = UIView()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    
    
    public init() {
        layoutInitialization()
    }
}


/**
 *  Layout -------------------------
 */
extension KRAlertView {
    private func layoutInitialization() {
        baseViewController.modalPresentationStyle = .OverCurrentContext
        baseViewController.view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        baseViewController.view.alpha = 0.0
        
        alertView.frame = CGRect(x: 0, y: 0, width: 270, height: 85)
        alertView.center = baseViewController.view.center
        alertView.autoresizingMask = [.FlexibleTopMargin, .FlexibleRightMargin, .FlexibleBottomMargin, .FlexibleLeftMargin]
        alertView.backgroundColor = .whiteColor()
        alertView.layer.cornerRadius = 10
        baseViewController.view.addSubview(alertView)
        
        titleLabel.frame = CGRect(x: 10, y: 20, width: 250, height: 25)
        titleLabel.backgroundColor = .clearColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        titleLabel.textAlignment = .Center
        titleLabel.text = "hogehoge"
        alertView.addSubview(titleLabel)
        
        messageLabel.frame = CGRect(x: 10, y: 50, width: 250, height: 15)
        messageLabel.backgroundColor = .clearColor()
        messageLabel.font = UIFont.systemFontOfSize(13)
        messageLabel.textAlignment = .Center
        messageLabel.numberOfLines = 0
        messageLabel.text = "hogehoge"
        alertView.addSubview(messageLabel)
    }
}


/**
 *  Add Button
 */
extension KRAlertView {
    
}


/**
 *  Show
 */
extension KRAlertView {
    public func show() {
        let visibleViewController = UIApplication.topViewController()
        visibleViewController!.presentViewController(baseViewController, animated: false) {
            UIView.animateWithDuration(0.2) {
                self.baseViewController.view.alpha = 1.0
            }
        }
    }
}


/**
 *  UIApplication
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