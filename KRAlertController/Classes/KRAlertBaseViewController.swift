//
//  KRAlertBaseViewController.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//
//  swiftlint:disable function_parameter_count

import UIKit

/**
 *  A KRAlertBaseViewController object displays an alert message to the user.
 */
class KRAlertBaseViewController: UIViewController {
   var style = KRAlertControllerStyle.alert
   var contentView: KRAlertContentView
   var statusBarHidden = false

   init(title: String?, message: String?, actions: [KRAlertAction], textFields: [UITextField], style: KRAlertControllerStyle, type: KRAlertControllerType) {
      self.style = style
      contentView = KRAlertContentView(title: title, message: message, actions: actions, textFields: textFields, style: style, type: type)
      super.init(nibName: nil, bundle: nil)
      configureLayout()
   }

   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   override func viewDidLoad() {
      super.viewDidLoad()
   }

   override var prefersStatusBarHidden: Bool {
      // Prefers status bar hidden value is same visible view controller.
      return statusBarHidden
   }
}

/**
 *  Actions -------------------
 */
extension KRAlertBaseViewController {
   func configureLayout() {
      modalPresentationStyle = .overCurrentContext
      view.backgroundColor = UIColor(white: 0, alpha: 0.4)
      view.alpha = 0.0
      configureContentView()
   }

   func configureContentView() {
      contentView.delegate = self
      var center = view.center
      center.y -= 50
      contentView.center = center

      if style == .actionSheet {
         var frame = contentView.frame
         frame.origin.y = view.bounds.height
         contentView.frame = frame
      }

      view.addSubview(contentView)
   }

   func showContent() {
      switch style {
      case .alert:
         view.alpha = 1.0

      case .actionSheet:
         view.alpha = 1.0
         var frame = contentView.frame
         frame.origin.y = view.bounds.height - contentView.bounds.height - 20
         contentView.frame = frame
      }
   }

   func hideContent() {
      switch style {
      case .alert:
         view.alpha = 0.0

      case .actionSheet:
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
      UIView.animate(withDuration: 0.2, animations: {
         self.hideContent()
      }, completion: { _ in
         self.dismiss(animated: false) {
            action.handler?(action, self.contentView.textFields)
         }
      })
   }
}
