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
    /// The actions that the user can take in response to the alert or action sheet. (read-only)
    public private(set) var actions = [KRAlertAction]()
    /// The array of text fields displayed by the alert. (read-only)
    public private(set) var textFields = [UITextField]()

    /**
     Creates and returns a controller for displaying an alert to the user. Default alert type is `.Normal`.

     - parameter title:   The title of the alert.
     - parameter message: Descriptive text that provides additional details about the reason for the alert.
     - parameter style:   Constants indicating the type of alert to display.
     */
    public convenience init(title: String?, message: String?, style: KRAlertControllerStyle = .Alert) {
        self.init()
        self.title = title
        self.message = message
        self.style = style
    }
}


/**
 *  Add Actions -------------
 */
extension KRAlertController {
    /**
     Attaches an cancel action object to the alert or action sheet.

     - parameter title: Cancel button title.
     - parameter handler: Cancel button action handler.

     - returns: KRAlertController object.
     */
    public func addCancel(title: String="Cancel", handler: KRAlertActionHandler? = nil) -> KRAlertController {
        let action = KRAlertAction(title: title, style: .Cancel, isPreferred: true, handler: handler)
        if actions.contains({ $0.style == .Cancel }) {
            fatalError("KRAlertController can only have one action with a style of KRAlertActionStyle.Cancel")
        }
        actions.append(action)

        return self
    }

    /**
     Attaches an destructive action object to the alert or action sheet.

     - parameter title: Destructive button title.
     - parameter isPreferred: When true, Action title become preferred style.
     - parameter handler: Destructive button action handler.

     - returns: KRAlertController object.
     */
    public func addDestructive(title: String, isPreferred: Bool = false, handler: KRAlertActionHandler? = nil) -> KRAlertController {
        let action = KRAlertAction(title: title, style: .Destructive, isPreferred: isPreferred, handler: handler)
        if actions.contains({ $0.style == .Cancel }) {
            fatalError("KRAlertController can only have one action with a style of KRAlertActionStyle.Cancel")
        }
        actions.append(action)

        return self
    }

    /**
     Attaches an action object to the alert or action sheet.

     - parameter title: Button title.
     - parameter isPreferred: When true, Action title become preferred style.
     - parameter handler: Button action handler.

     - returns: KRAlertController object.
     */
    public func addAction(title: String, isPreferred: Bool = false, handler: KRAlertActionHandler? = nil) -> KRAlertController {
        let action = KRAlertAction(title: title, style: .Default, isPreferred: isPreferred, handler: handler)
        if actions.contains({ $0.style == .Cancel }) {
            assert(action.style == .Cancel, "KRAlertController can only have one action with a style of KRAlertActionStyle.Cancel")
        }
        actions.append(action)

        return self
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

     - returns: KRAlertController object.
     */
    public func addTextField(configurationHandler: ((textField: UITextField) -> Void)? = nil) -> KRAlertController {
        assert(style == .Alert, "Text fields can only be added to an alert controller of style KRAlertControllerStyle.Alert")
        assert(textFields.count < 3, "KRAlertController can add text fields up to 3")

        let textField = UITextField()
        configurationHandler?(textField: textField)
        textFields.append(textField)

        return self
    }
}


/**
 *  Show actions ------------
 */
extension KRAlertController {
    /**
     Display alert. Default view controller to display alert is visible view controller of key window.
     The completion handler is called after the viewDidAppear: method is called on the presented view controller.

     - parameter presentingVC:  The view controller to display over the current view controller’s content.
     - parameter animated:     Pass true to animate the presentation; otherwise, pass false.
     - parameter completion:   The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.

     - returns: No return value
     */
    public func show(presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
        show(.Normal, presentingVC: presentingVC, animated: animated, completion: completion)
    }

    /**
     Display success alert. Default view controller to display alert is visible view controller of key window.
     The completion handler is called after the viewDidAppear: method is called on the presented view controller.

     - parameter icon:  Pass true to display success glaph icon; otherwise, pass false..
     - parameter presentingVC:  The view controller to display over the current view controller’s content.
     - parameter animated:     Pass true to animate the presentation; otherwise, pass false.
     - parameter completion:   The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.

     - returns: No return value
     */
    public func showSuccess(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
        show(.Success(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
    }

    /**
     Display information alert. Default view controller to display alert is visible view controller of key window.
     The completion handler is called after the viewDidAppear: method is called on the presented view controller.

     - parameter icon:  Pass true to display information glaph icon; otherwise, pass false..
     - parameter presentingVC:  The view controller to display over the current view controller’s content.
     - parameter animated:     Pass true to animate the presentation; otherwise, pass false.
     - parameter completion:   The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.

     - returns: No return value
     */
    public func showInformation(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
        show(.Information(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
    }

    /**
     Display warning alert. Default view controller to display alert is visible view controller of key window.
     The completion handler is called after the viewDidAppear: method is called on the presented view controller.

     - parameter icon:  Pass true to display warning glaph icon; otherwise, pass false..
     - parameter presentingVC:  The view controller to display over the current view controller’s content.
     - parameter animated:     Pass true to animate the presentation; otherwise, pass false.
     - parameter completion:   The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.

     - returns: No return value
     */
    public func showWarning(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
        show(.Warning(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
    }

    /**
     Display error alert. Default view controller to display alert is visible view controller of key window.
     The completion handler is called after the viewDidAppear: method is called on the presented view controller.

     - parameter icon:  Pass true to display error glaph icon; otherwise, pass false..
     - parameter presentingVC:  The view controller to display over the current view controller’s content.
     - parameter animated:     Pass true to animate the presentation; otherwise, pass false.
     - parameter completion:   The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.

     - returns: No return value
     */
    public func showError(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
        show(.Error(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
    }

    /**
     Display edit alert. Default view controller to display alert is visible view controller of key window.
     The completion handler is called after the viewDidAppear: method is called on the presented view controller.

     - parameter icon:  Pass true to display edit glaph icon; otherwise, pass false..
     - parameter presentingVC:  The view controller to display over the current view controller’s content.
     - parameter animated:     Pass true to animate the presentation; otherwise, pass false.
     - parameter completion:   The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.

     - returns: No return value
     */
    public func showEdit(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
        show(.Edit(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
    }

    /**
     Display authorize alert. Default view controller to display alert is visible view controller of key window.
     The completion handler is called after the viewDidAppear: method is called on the presented view controller.

     - parameter icon:  Pass true to display authorize glaph icon; otherwise, pass false..
     - parameter presentingVC:  The view controller to display over the current view controller’s content.
     - parameter animated:     Pass true to animate the presentation; otherwise, pass false.
     - parameter completion:   The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.

     - returns: No return value
     */
    public func showAuthorize(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
        show(.Authorize(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
    }
}


/**
 *  Private actions ------------
 */
extension KRAlertController {
    private func show(type: KRAlertControllerType, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
        guard let vc = presentingVC ?? UIApplication.topViewController() else {
            print("View controller to present alert controller isn't found!")
            return
        }

        let alertVC = makeAlertViewController(type)
        alertVC.statusBarHidden = vc.prefersStatusBarHidden()

        vc.presentViewController(alertVC, animated: false) {
            UIView.animateWithDuration(0.2) {
                alertVC.showContent()
            }
        }
    }

    private func makeAlertViewController(type: KRAlertControllerType) -> KRAlertBaseViewController {
        let baseVC = KRAlertBaseViewController(title: title, message: message, actions: actions, textFields: textFields, style: style, type: type)
        return baseVC
    }
}
