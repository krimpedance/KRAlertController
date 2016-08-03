//
//  KRAlertContentView.swift
//  KRAlertController
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//
//  swiftlint:disable function_parameter_count
// swiftlint:disable legacy_constant

import UIKit

/**
 *  This Method is called when tapping some buttons.
 */
protocol KRAlertViewDelegate {
    func didSelectActionButton(action: KRAlertAction)
}

/**
 *  KRAlertContentView is contents that display.
 */
class KRAlertContentView: UIView {

    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let textFieldView = KRAlertTextFieldView()

    var title: String?
    var message: String?
    var style = KRAlertControllerStyle.Alert
    var type = KRAlertControllerType.Normal
    var actions = [KRAlertAction]()
    var textFields = [KRAlertTextField]()

    var delegate: KRAlertViewDelegate?

    var buttonLayoutType: KRButtonLayoutType {
        switch actions.count {
        case let count where count>5:
            return .VerticalTable
        case 2:
            if style == .Alert {
                return .Horizontal
            } else {
                return .Vertical
            }
        default:
            return .Vertical
        }
    }

    convenience init(title: String?, message: String?, actions: [KRAlertAction], textFields: [KRAlertTextField], style: KRAlertControllerStyle, type: KRAlertControllerType) {
        switch style {
        case .Alert:
            self.init(frame: CGRect(x: 0, y: 0, width: 270, height: 0))
        case .ActionSheet:
            let screenSize = UIScreen.mainScreen().bounds.size
            self.init(frame: CGRect(x: 0, y: 0, width: screenSize.width-20*2, height: 0))
        }
        self.title = title
        self.message = message
        self.actions = actions
        self.textFields = textFields
        self.style = style
        self.type = type
        setContents()
    }
}


/**
 *  Calculated frame properties --------------------
 */
private extension KRAlertContentView {
    var verticalMargin: CGFloat { return 10 }
    var horizontalMargin: CGFloat { return 10 }
    var marginBetweenContents: CGFloat { return 5 }

    var contentWidth: CGFloat {
        return frame.width - horizontalMargin*2
    }

    var contentHeight: CGFloat {
        let labelsHeight = titleFrame.height + marginBetweenContents + messageFrame.height

        var buttonsHeight: CGFloat
        switch buttonLayoutType {
        case .Vertical:
            buttonsHeight = CGFloat(actions.count) * (buttonFrame().height + marginBetweenContents*2) - marginBetweenContents*2
        case .VerticalTable:
            buttonsHeight = buttonTableFrame.height
        case .Horizontal:
            buttonsHeight = buttonFrame().height
        }

        switch (textFields.count, actions.count) {
        case (0, 0): return labelsHeight
        case (_, 0): return labelsHeight + verticalMargin + textFieldViewFrame.height
        case (0, _): return labelsHeight + verticalMargin*2 + buttonsHeight
        default: return labelsHeight + verticalMargin*3 + textFieldViewFrame.height + buttonsHeight
        }
    }


    var titleFrame: CGRect {
        return CGRect(x: horizontalMargin, y: verticalMargin, width: contentWidth, height: titleLabel.bounds.height)
    }

    var messageFrame: CGRect {
        let yPos: CGFloat = titleLabel.frame.origin.y+titleLabel.bounds.height+marginBetweenContents
        return CGRect(x: horizontalMargin, y: yPos, width: contentWidth, height: messageLabel.bounds.height)
    }

    var textFieldViewFrame: CGRect {
        let yPos = messageFrame.origin.y + messageFrame.height + verticalMargin
        let height = CGFloat(textFields.count) * (30 + 1)
        return CGRect(x: horizontalMargin, y: yPos, width: contentWidth, height: height)
    }

    var buttonFrameYPosition: CGFloat {
        if textFields.count == 0 {
            return messageFrame.origin.y + messageFrame.height + verticalMargin*2
        } else {
            return textFieldViewFrame.origin.y + textFieldViewFrame.height + verticalMargin*2
        }
    }

    var buttonTableFrame: CGRect {
        let yPos = buttonFrameYPosition
        return CGRect(x: horizontalMargin, y: yPos, width: contentWidth, height: 230)
    }

    func buttonFrame(index index: Int = 0) -> CGRect {
        let yPos = buttonFrameYPosition
        var point = CGPoint(x: horizontalMargin, y: yPos)
        var size = CGSize(width: contentWidth, height: 30)

        switch buttonLayoutType {
        case .Vertical:
            point.y += CGFloat(index) * (marginBetweenContents*2 + size.height)
        case .VerticalTable:
            return CGRect(origin: CGPointZero, size: size)
        case .Horizontal:
            size.width = (contentWidth - horizontalMargin) / 2
            point.x += CGFloat(index) * (horizontalMargin + size.width)
        }

        return CGRect(origin: point, size: size)
    }
}


/**
 *  Actions --------------------
 */
private extension KRAlertContentView {
    func setContents() {
        titleLabel.configureLayout(titleFrame, text: title, controllerType: type, labelStyle: .Title)
        addSubview(titleLabel)
        messageLabel.configureLayout(messageFrame, text: message, controllerType: type, labelStyle: .Message)
        addSubview(messageLabel)
        if textFields.count>0 {
            textFieldView.configureLayout(textFieldViewFrame, textFields: textFields, controllerType: type)
            addSubview(textFieldView)
        }

        if type.isShowIcon { setIcon() }

        switch buttonLayoutType {
        case .VerticalTable:
            setButtonTable()
        default:
            let buttons = getActionButtons()
            buttons.forEach { addSubview($0) }
        }

        autoresizingMask = [.FlexibleTopMargin, .FlexibleRightMargin, .FlexibleBottomMargin, .FlexibleLeftMargin]
        backgroundColor = .whiteColor()
        layer.cornerRadius = 10
        var frame = self.frame
        frame.size.height = verticalMargin*2 + contentHeight
        self.frame = frame
    }

    func setIcon() {
        let height = messageLabel.frame.origin.y + messageLabel.frame.height - titleLabel.frame.origin.y
        let origin = CGPoint(x: center.x - height, y: titleLabel.frame.origin.y)
        let iconLayer = type.getIconLayer(CGRect(origin: origin, size: CGSize(width: height*2, height: height)))
        iconLayer.zPosition = -1
        layer.addSublayer(iconLayer)
    }

    func setButtonTable() {
        let table = KRAlertButtonTable(frame: buttonTableFrame, buttons: getActionButtons())
        addSubview(table)
    }

    func getActionButtons() -> [KRAlertButton] {
        var sortedActions = actions.filter({ $0.style != .Cancel })
        if let cancelAction = actions.filter({ $0.style == .Cancel }).first {
            if buttonLayoutType == .Horizontal && style == .Alert {
                sortedActions.insert(cancelAction, atIndex: 0)
            } else {
                sortedActions.append(cancelAction)
            }
        }

        let buttons = sortedActions.enumerate().map { index, action -> KRAlertButton in
            let button = KRAlertButton(frame: buttonFrame(index: index), action: action, type: type)
            button.addTarget(self, action: #selector(KRAlertContentView.actionButtonTapped(_:)), forControlEvents: .TouchUpInside)
            return button
        }
        return buttons
    }
}


/**
 *  Button actions --------------------
 */
extension KRAlertContentView {
    func actionButtonTapped(button: KRAlertButton) {
        delegate?.didSelectActionButton(button.action)
    }
}
