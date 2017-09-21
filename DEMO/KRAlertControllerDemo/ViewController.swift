//
//  ViewController.swift
//  KRAlertControllerDemo
//
//  Created by Ryunosuke Kirikihira on 2016/06/18.
//  Copyright © 2016年 Krimpedance. All rights reserved.
//
// swiftlint:disable cyclomatic_complexity

import UIKit
import KRAlertController

class ViewController: UIViewController {

   @IBOutlet weak var alertStyleControl: UISegmentedControl!
   @IBOutlet weak var buttonNumControl: UISegmentedControl!
   @IBOutlet weak var displayIconControl: UISegmentedControl!

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

/**
 *  Actions -------------
 */
extension ViewController {
   func getAlertText(_ index: Int, style: KRAlertControllerStyle) -> (title: String, message: String) {
      switch index {
      case 1:
         return ("Normal", "This is .Normal alert\nThis is default.")
      case 2:
         return ("Success", "This is .Success alert.")
      case 3:
         return ("Information", "This is .Information alert.")
      case 4:
         return ("Warning", "This is .Warning alert.")
      case 5:
         return ("Error", "This is .Error alert.")
      case 6:
         if style == .alert { return ("Edit", "This is .Edit alert.\nThis alert added single text field.") } else { return ("Edit", "This is .Edit alert.\nText fields can only use .Alert style.") }
      case 7:
         if style == .alert { return ("Authorize", "This is .Authorize alert.\nThis alert added two text field.") } else { return ("Edit", "This is .Authorize alert.\nText fields can only use .Alert style.") }
      default:
         return ("", "")
      }
   }
}

/**
 *  Button actions -------------
 */
extension ViewController {
   @IBAction func showAlertButtonTapped(_ sender: UIButton) {
      let isDisplayIcon = (displayIconControl.selectedSegmentIndex==0) ? true : false
      let alertStyle: KRAlertControllerStyle = (alertStyleControl.selectedSegmentIndex==0) ? .alert : .actionSheet
      let alertText = getAlertText(sender.tag, style: alertStyle)

      var alert: KRAlertController
      switch buttonNumControl.selectedSegmentIndex {
      case 0:
         alert = KRAlertController(title: alertText.title, message: alertText.message, style: alertStyle)
            .addAction(title: "OK")

      case 1:
         alert = KRAlertController(title: alertText.title, message: alertText.message, style: alertStyle)
            .addAction(title: "Button1")
            .addCancel()

      case 2:
         alert = KRAlertController(title: alertText.title, message: alertText.message, style: alertStyle)
            .addAction(title: "Button1")
            .addAction(title: "Button2")
            .addCancel()

      default: return
      }

      defer {
         switch sender.tag {
         case 1: alert.show()
         case 2: alert.showSuccess(icon: isDisplayIcon)
         case 3: alert.showInformation(icon: isDisplayIcon)
         case 4: alert.showWarning(icon: isDisplayIcon)
         case 5: alert.showError(icon: isDisplayIcon)
         case 6: alert.showEdit(icon: isDisplayIcon)
         case 7: alert.showAuthorize(icon: isDisplayIcon)
         default: break
         }
      }

      if alertStyle == .actionSheet { return }

      switch sender.tag {
      case 6:
         alert = alert.addTextField({ (textField) in
            textField.placeholder = "Your name"
         })
      case 7:
         alert = alert .addTextField({ (textField) in
            textField.placeholder = "Email"
         })
            .addTextField({ (textField) in
               textField.placeholder = "Password"
               textField.isSecureTextEntry = true
            })
      default: break
      }
   }
}
