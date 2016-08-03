//
//  KRAlertAction.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  Action handler when user tapped some buttons.
 *
 *  - parameter KRAlertAction: Tapped button's action
 *
 *  - returns: Void
 */
public typealias KRAlertActionHandler = (action: KRAlertAction) -> ()

/**
 *  A KRAlertAction object represents an action that can be taken when tapping a button in an alert.
 *  You use this class to configure information about a single action, including the title to display in the button, any styling information, and a handler to execute when the user taps the button.
 *  After creating an alert action object, add it to a KRAlertController object before displaying the corresponding alert to the user.
 */
public struct KRAlertAction {
    let actionId: String = NSUUID().UUIDString
    let handler: KRAlertActionHandler?

    /// The text to use for the button title.
    public let title: String?
    /// Additional styling information to apply to the button.
    public let style: KRAlertActionStyle
    var isPreferred: Bool = false
    public var enabled: Bool = true

    /**
    Create and return an action with the specified title and behavior.

     - parameter title:   The text to use for the button title.
     - parameter style:   Additional styling information to apply to the button.
     - parameter handler: A block to execute when the user selects the action.
     */
    public init(title: String?, style: KRAlertActionStyle, handler: KRAlertActionHandler?) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}
