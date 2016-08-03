//
//  KRAlertButtonTable.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  KRAlertButtonTable is used at more than 5 actions.
 */
class KRAlertButtonTable: UITableView {

    var buttons = [KRAlertButton]()

    convenience init(frame: CGRect, buttons: [KRAlertButton]) {
        self.init(frame: frame)
        self.buttons = buttons
        setup()
    }
}


/**
 *  Actions --------------------
 */
extension KRAlertButtonTable {
    func setup() {
        backgroundColor = .clearColor()
        separatorStyle = .None
        dataSource = self
    }
}


/**
 *  UITableView data source --------------------
 */
extension KRAlertButtonTable: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttons.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") ?? UITableViewCell()
        cell.backgroundColor = .clearColor()
        cell.selectionStyle = .None
        cell.contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
        cell.addSubview(buttons[indexPath.row])
        return cell
    }
}


/**
 *  UITableView data source --------------------
 */
extension KRAlertButtonTable: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 35
    }
}
