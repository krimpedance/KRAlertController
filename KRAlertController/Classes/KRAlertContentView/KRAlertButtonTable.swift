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
        backgroundColor = .clear
        separatorStyle = .none
        dataSource = self
    }
}


/**
 *  UITableView data source --------------------
 */
extension KRAlertButtonTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
        cell.addSubview(buttons[(indexPath as NSIndexPath).row])
        return cell
    }
}


/**
 *  UITableView data source --------------------
 */
extension KRAlertButtonTable: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}
