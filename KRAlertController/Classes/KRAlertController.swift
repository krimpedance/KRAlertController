//
//  KRAlertContoller.swift
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit


/**
 *  KRAlertController -----------------
 */
public final class KRAlertController {
    
    public var title: String?
    public var message: String?
 
    public private(set) var style = KRAlertControllerStyle.Alert
    public var type = KRAlertControllerType.Normal
    
    public private(set) var actions = [KRAlertAction]()
    public var preferredAction: KRAlertAction?
    
    var alertTextFields = [KRAlertTextField]()
    public var textFields: [UITextField] { return alertTextFields }
}


/**
 *  Initializer ------------
 */
extension KRAlertController {
    public convenience init(title: String?, message: String?) {
        self.init()
        self.title = title
        self.message = message
    }

    public convenience init(title: String?, message: String?, style: KRAlertControllerStyle) {
        self.init(title: title, message: message)
        self.style = style
    }

    public convenience init(title: String?, message: String?, style: KRAlertControllerStyle, type: KRAlertControllerType) {
        self.init(title: title, message: message, style: style)
        self.type = type
    }
}


/**
 *  Add Actions -------------
 */
extension KRAlertController {
    public func addAction(action: KRAlertAction) {
        if actions.contains({ $0.style == .Cancel }) {
            assert(action.style == .Cancel , "KRAlertController can only have one action with a style of KRAlertActionStyle.Cancel")
        }
        actions.append(action)
    }

    public func addTextFieldWithConfigurationHandler(configurationHandler: ((textField: UITextField) -> Void)?) {
        assert(style == .Alert, "Text fields can only be added to an alert controller of style KRAlertControllerStyle.Alert")
        assert(textFields.count < 3, "KRAlertController can add text fields up to 3")
        
        let textField = KRAlertTextField(type: type)
        configurationHandler?(textField: textField)
        alertTextFields.append(textField)
    }
}


/**
 *  Show ------------
 */
extension KRAlertController {
    private func makeAlertViewController() -> KRAlertBaseViewController {
        let baseVC = KRAlertBaseViewController()
        baseVC.style = style
        let view = KRAlertContentView(title: title, message: message, actions: actions, textFields: alertTextFields, style: style, type: type)
        baseVC.addContentView(view)
        return baseVC
    }
    
    public func show() {
        guard let visibleVC = UIApplication.topViewController() else {
            print("View controller to present alert controller isn't found!")
            return
        }

        let alertVC = makeAlertViewController()
        alertVC.statusBarHidden = visibleVC.prefersStatusBarHidden()
        
        visibleVC.presentViewController(alertVC, animated: false) {
            UIView.animateWithDuration(0.2) {
                alertVC.showContent()
            }
        }
    }
}
