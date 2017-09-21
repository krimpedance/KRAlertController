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
public typealias KRAlertActionHandler = (_ action: KRAlertAction, _ textFields: [UITextField]) -> Void

/**
 *  A KRAlertAction object represents an action that can be taken when tapping a button in an alert.
 *  You use this class to configure information about a single action, including the title to display in the button, any styling information, and a handler to execute when the user taps the button.
 *  After creating an alert action object, add it to a KRAlertController object before displaying the corresponding alert to the user.
 */
public struct KRAlertAction {
   let actionId: String = UUID().uuidString
   let handler: KRAlertActionHandler?

   /// The text to use for the button title.
   public let title: String?
   /// Additional styling information to apply to the button.
   public let style: KRAlertActionStyle
   let isPreferred: Bool
   public var enabled: Bool = true

   /**
    Create and return an action with the specified title and behavior.
    
    - parameter title:   The text to use for the button title.
    - parameter style:   Additional styling information to apply to the button.
    - parameter isPreferred: When true, Action title become preferred style.
    - parameter handler: A block to execute when the user selects the action.
    */
   init(title: String?, style: KRAlertActionStyle, isPreferred: Bool, handler: KRAlertActionHandler?) {
      self.title = title
      self.style = style
      self.handler = handler
      self.isPreferred = isPreferred
   }
}
