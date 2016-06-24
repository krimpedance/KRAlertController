//
//  KRAlertBaseViewController.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

class KRAlertBaseViewController: UIViewController {

    var style = KRAlertControllerStyle.Alert
    var contentView: KRAlertContentView?
    var statusBarHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return statusBarHidden
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


/**
 *  Actions -------------------
 */
extension KRAlertBaseViewController {
    func configureLayout() {
        modalPresentationStyle = .OverCurrentContext
        view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        view.alpha = 0.0
    }
    
    func addContentView(contentView: KRAlertContentView) {
        self.contentView = contentView
        contentView.delegate = self
        var center = view.center
        center.y -= 50
        contentView.center = center
        
        if style == .ActionSheet {
            var frame = contentView.frame
            frame.origin.y = view.bounds.height
            contentView.frame = frame
        }
        
        view.addSubview(contentView)
    }
    
    func showContent() {
        switch style {
        case .Alert:
            view.alpha = 1.0
            
        case .ActionSheet:
            guard let contentView = contentView else { return }
            view.alpha = 1.0
            var frame = contentView.frame
            frame.origin.y = view.bounds.height - contentView.bounds.height - 20
            contentView.frame = frame
        }
    }
    
    func hideContent() {
        switch style {
        case .Alert:
            view.alpha = 0.0
            
        case .ActionSheet:
            guard let contentView = contentView else { return }
            view.alpha = 0.0
            var frame = contentView.frame
            frame.origin.y = view.bounds.height
            contentView.frame = frame
        }
    }
}


/**
 *  KRAlertViewDelegate ------------
 */
extension KRAlertBaseViewController: KRAlertViewDelegate {
    func didSelectActionButton(action: KRAlertAction) {
        UIView.animateWithDuration(0.2, animations: {
            self.hideContent()
        }) { _ in
            self.dismissViewControllerAnimated(false) {
                action.handler?(action: action)
            }
        }
    }
}