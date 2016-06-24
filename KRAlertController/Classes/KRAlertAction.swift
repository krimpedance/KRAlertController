//
//  KRAlertAction.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

public typealias KRAlertActionHandler = (action: KRAlertAction) -> ()

public struct KRAlertAction {
    let actionId: String = NSUUID().UUIDString
    let handler: KRAlertActionHandler?
    
    public let title: String?
    public let style: KRAlertActionStyle
    private var isPreferred: Bool = false
    public var enabled: Bool = true

    public init(title: String?, style: KRAlertActionStyle, handler: KRAlertActionHandler?) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}


/**
 *  Actions -----------
 */
extension KRAlertAction {
}