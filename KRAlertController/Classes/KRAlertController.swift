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
    public fileprivate(set) var style = KRAlertControllerStyle.alert
    /// The actions that the user can take in response to the alert or action sheet. (read-only)
    public fileprivate(set) var actions = [KRAlertAction]()
    /// The array of text fields displayed by the alert. (read-only)
    public fileprivate(set) var textFields = [UITextField]()

    /**
     Creates and returns a controller for displaying an alert to the user. Default alert type is `.Normal`.
     
     - parameter title:   The title of the alert.
     - parameter message: Descriptive text that provides additional details about the reason for the alert.
     - parameter style:   Constants indicating the type of alert to display.
     */
    public convenience init(title: String?, message: String?, style: KRAlertControllerStyle = .alert) {
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
        let action = KRAlertAction(title: title, style: .cancel, isPreferred: true, handler: handler)
        if actions.contains(where: { $0.style == .cancel }) {
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
        let action = KRAlertAction(title: title, style: .destructive, isPreferred: isPreferred, handler: handler)
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
        let action = KRAlertAction(title: title, style: .default, isPreferred: isPreferred, handler: handler)
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
    public func addTextField(_ configurationHandler: ((_ textField: UITextField) -> Void)? = nil) -> KRAlertController {
        assert(style == .alert, "Text fields can only be added to an alert controller of style KRAlertControllerStyle.Alert")
        assert(textFields.count < 3, "KRAlertController can add text fields up to 3")

        let textField = UITextField()
        configurationHandler?(textField)
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
    public func show(presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        show(.normal, presentingVC: presentingVC, animated: animated, completion: completion)
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
    public func showSuccess(icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        show(.success(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
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
    public func showInformation(icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        show(.information(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
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
    public func showWarning(icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        show(.warning(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
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
    public func showError(icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        show(.error(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
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
    public func showEdit(icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        show(.edit(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
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
    public func showAuthorize(icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        show(.authorize(icon: icon), presentingVC: presentingVC, animated: animated, completion: completion)
    }
}

/**
 *  Private actions ------------
 */
extension KRAlertController {
    fileprivate func show(_ type: KRAlertControllerType, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        guard let viewController = presentingVC ?? UIApplication.shared.topViewController() else {
            print("View controller to present alert controller isn't found!")
            return
        }

        let alertVC = makeAlertViewController(type)
        alertVC.statusBarHidden = viewController.prefersStatusBarHidden

        viewController.present(alertVC, animated: false) {
            UIView.animate(withDuration: 0.2, animations: {
                alertVC.showContent()
            })
        }
    }

    fileprivate func makeAlertViewController(_ type: KRAlertControllerType) -> KRAlertBaseViewController {
        let baseVC = KRAlertBaseViewController(title: title, message: message, actions: actions, textFields: textFields, style: style, type: type)
        return baseVC
    }
}
