//
//  ViewController.swift
//  KRAlertControllerDemo
//
//  Created by Ryunosuke Kirikihira on 2016/06/18.
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

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
    func getAlertText(type: KRAlertControllerType, style: KRAlertControllerStyle) -> (title: String, message: String) {
        switch type {
        case .Normal:
            return ("Normal", "This is .Normal alert\nThis is default.")
        case .Success:
            return ("Success", "This is .Success alert.")
        case .Information:
            return ("Information", "This is .Information alert.")
        case .Warning:
            return ("Warning", "This is .Warning alert.")
        case .Error:
            return ("Error", "This is .Error alert.")
        case .Edit:
            if style == .Alert { return ("Edit", "This is .Edit alert.\nThis alert added single text field.") }
            else { return ("Edit", "This is .Edit alert.\nText fields can only use .Alert style.") }
        case .Authorize:                                
            if style == .Alert { return ("Authorize", "This is .Authorize alert.\nThis alert added two text field.") }
            else { return ("Edit", "This is .Authorize alert.\nText fields can only use .Alert style.") }
                                                        
        }                                                  
    }
}


/**
 *  Button actions -------------
 */
extension ViewController {
    @IBAction func showAlertButtonTapped(sender: UIButton) {
        let isDisplayIcon = (displayIconControl.selectedSegmentIndex==0) ? true : false
        let alertStyle: KRAlertControllerStyle = (alertStyleControl.selectedSegmentIndex==0) ? .Alert : .ActionSheet
        let type: KRAlertControllerType
        switch sender.tag {
        case 1: type = .Normal
        case 2: type = .Success(icon: isDisplayIcon)
        case 3: type = .Information(icon: isDisplayIcon)
        case 4: type = .Warning(icon: isDisplayIcon)
        case 5: type = .Error(icon: isDisplayIcon)
        case 6: type = .Edit(icon: isDisplayIcon)
        case 7: type = .Authorize(icon: isDisplayIcon)
        default: return
        }
        let alertText = getAlertText(type, style: alertStyle)

        let alert  = KRAlertController(title: alertText.title, message: alertText.message, style: alertStyle, type: type)
        (0...buttonNumControl.selectedSegmentIndex).forEach {
            let action = KRAlertAction(title: "Button\($0)", style: .Default, handler: nil)
            alert.addAction(action)
        }
        let action = KRAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(action)
        
        defer { alert.show() }
        
        if alertStyle == .ActionSheet { return }
        
        switch type {
        case .Edit:
            alert.addTextFieldWithConfigurationHandler({ (textField) in
                textField.placeholder = "Your name"
            })
        case .Authorize:
            alert.addTextFieldWithConfigurationHandler({ (textField) in
                textField.placeholder = "Email"
            })
            alert.addTextFieldWithConfigurationHandler({ (textField) in
                textField.placeholder = "Password"
                textField.secureTextEntry = true
            })
        default: break
        }
    }
    
}