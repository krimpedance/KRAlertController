//
//  KRAlertContoller.swift
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  KRAlertController is a beautiful and easy-to-use alert controller
 *  A KRAlertController object displays an alert message to the user. 
 *  After configuring the alert controller with the actions and style you want, present it using the `show()` method.
 */
public final class KRAlertController {

    /// Alert title
    public var title: String?
    /// Alert message
    public var message: String?

    /// Alert style (read only)
    public private(set) var style = KRAlertControllerStyle.Alert
    /// Alert type
    public var type = KRAlertControllerType.Normal

    /// The actions that the user can take in response to the alert or action sheet. (read-only)
    public private(set) var actions = [KRAlertAction]()
    /// The preferred action for the user to take from an alert.
    public var preferredAction: KRAlertAction? {
        didSet {
            actions = actions.map {
                if $0.actionId != preferredAction?.actionId { return $0 }
                var action = $0
                action.isPreferred = true
                return action
            }
        }
    }

    /// The array of text fields displayed by the alert. (read-only)
    public var textFields: [UITextField] { return alertTextFields }
    var alertTextFields = [KRAlertTextField]()
}


/**
 *  Initializer ------------
 */
extension KRAlertController {
    /**
     Creates and returns a controller for displaying an alert to the user. Default alert style is .Alert and default type is `.Normal`.

     - parameter title:   The title of the alert.
     - parameter message: Descriptive text that provides additional details about the reason for the alert.

     - returns: An initialized alert controller object.
     */
    public convenience init(title: String?, message: String?) {
        self.init()
        self.title = title
        self.message = message
    }

    /**
     Creates and returns a controller for displaying an alert to the user. Default alert type is `.Normal`.

     - parameter title:   The title of the alert.
     - parameter message: Descriptive text that provides additional details about the reason for the alert.
     - parameter style:   Constants indicating the type of alert to display.

     - returns: An initialized alert controller object.
     */
    public convenience init(title: String?, message: String?, style: KRAlertControllerStyle) {
        self.init(title: title, message: message)
        self.style = style
    }

    /**
     Creates and returns a controller for displaying an alert to the user.
     
     - parameter title:   The title of the alert.
     - parameter message: Descriptive text that provides additional details about the reason for the alert.
     - parameter style:   Constants indicating the type of alert to display.
     - parameter type:    Constants indicating the color of alert to display

     - returns: An initialized alert controller object.
     */
    public convenience init(title: String?, message: String?, style: KRAlertControllerStyle, type: KRAlertControllerType) {
        self.init(title: title, message: message, style: style)
        self.type = type
    }
}


/**
 *  Add Actions -------------
 */
extension KRAlertController {
    /**
     Attaches an action object to the alert or action sheet.

     - parameter action: The action object to display as part of the alert.
     */
    public func addAction(action: KRAlertAction) {
        if actions.contains({ $0.style == .Cancel }) {
            assert(action.style == .Cancel , "KRAlertController can only have one action with a style of KRAlertActionStyle.Cancel")
        }
        actions.append(action)
    }

    /**
     Adds a text field to an alert. But several setting would be reset.
        - Frame
        - Font size
        - Border width
        - Border color
        - Text color
        - Placeholder color

     - parameter configurationHandler: A block for configuring the text field prior to displaying the alert.
     */
    public func addTextFieldWithConfigurationHandler(configurationHandler: ((textField: UITextField) -> Void)?) {
        assert(style == .Alert, "Text fields can only be added to an alert controller of style KRAlertControllerStyle.Alert")
        assert(textFields.count < 3, "KRAlertController can add text fields up to 3")

        let textField = KRAlertTextField(type: type)
        configurationHandler?(textField: textField)
        alertTextFields.append(textField)
    }
}


/**
 *  Show actions ------------
 */
extension KRAlertController {
    private func makeAlertViewController() -> KRAlertBaseViewController {
        let baseVC = KRAlertBaseViewController()
        baseVC.style = style
        let view = KRAlertContentView(title: title, message: message, actions: actions, textFields: alertTextFields, style: style, type: type)
        baseVC.addContentView(view)
        return baseVC
    }

    /**
     Display alert on visible view controller of key window.
     */
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