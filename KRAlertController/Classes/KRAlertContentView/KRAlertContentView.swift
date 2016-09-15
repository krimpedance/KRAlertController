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

    var style = KRAlertControllerStyle.alert
    var type = KRAlertControllerType.normal
    var actions = [KRAlertAction]()
    var textFields = [UITextField]()

    var delegate: KRAlertViewDelegate?

    var buttonLayoutType: KRButtonLayoutType {
        switch actions.count {
        case let count where count>5:
            return .verticalTable
        case 2:
            if style == .alert {
                return .horizontal
            } else {
                return .vertical
            }
        default:
            return .vertical
        }
    }

    init(title: String?, message: String?, actions: [KRAlertAction], textFields: [UITextField], style: KRAlertControllerStyle, type: KRAlertControllerType) {
        self.actions = actions
        self.textFields = textFields
        self.style = style
        self.type = type
        switch style {
        case .alert:
            super.init(frame: CGRect(x: 0, y: 0, width: 270, height: 0))
        case .actionSheet:
            let screenSize = UIScreen.main.bounds.size
            super.init(frame: CGRect(x: 0, y: 0, width: screenSize.width-20*2, height: 0))
        }
        setContents(title: title, message: message)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        case .vertical:
            buttonsHeight = CGFloat(actions.count) * (buttonFrame().height + marginBetweenContents*2) - marginBetweenContents*2
        case .verticalTable:
            buttonsHeight = buttonTableFrame.height
        case .horizontal:
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

    func buttonFrame(index: Int = 0) -> CGRect {
        let yPos = buttonFrameYPosition
        var point = CGPoint(x: horizontalMargin, y: yPos)
        var size = CGSize(width: contentWidth, height: 30)

        switch buttonLayoutType {
        case .vertical:
            point.y += CGFloat(index) * (marginBetweenContents*2 + size.height)
        case .verticalTable:
            return CGRect(origin: CGPoint.zero, size: size)
        case .horizontal:
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
    func setContents(title: String?, message: String?) {
        titleLabel.configureLayout(frame: titleFrame, text: title, controllerType: type, labelStyle: .title)
        addSubview(titleLabel)
        messageLabel.configureLayout(frame: messageFrame, text: message, controllerType: type, labelStyle: .message)
        addSubview(messageLabel)
        if textFields.count>0 {
            textFieldView.configureLayout(textFieldViewFrame, textFields: textFields, controllerType: type)
            addSubview(textFieldView)
        }

        if type.isShowIcon { setIcon() }

        switch buttonLayoutType {
        case .verticalTable:
            setButtonTable()
        default:
            let buttons = getActionButtons()
            buttons.forEach { addSubview($0) }
        }

        autoresizingMask = [.flexibleTopMargin, .flexibleRightMargin, .flexibleBottomMargin, .flexibleLeftMargin]
        backgroundColor = .white
        layer.cornerRadius = 10
        var frame = self.frame
        frame.size.height = verticalMargin*2 + contentHeight
        self.frame = frame
    }

    func setIcon() {
        let height = messageLabel.frame.origin.y + messageLabel.frame.height - titleLabel.frame.origin.y
        let origin = CGPoint(x: center.x - height, y: titleLabel.frame.origin.y)
        let iconLayer = type.getIconLayer(rect: CGRect(origin: origin, size: CGSize(width: height*2, height: height)))
        iconLayer.zPosition = -1
        layer.addSublayer(iconLayer)
    }

    func setButtonTable() {
        let table = KRAlertButtonTable(frame: buttonTableFrame, buttons: getActionButtons())
        addSubview(table)
    }

    func getActionButtons() -> [KRAlertButton] {
        var sortedActions = actions.filter({ $0.style != .cancel })
        if let cancelAction = actions.filter({ $0.style == .cancel }).first {
            if buttonLayoutType == .horizontal && style == .alert {
                sortedActions.insert(cancelAction, at: 0)
            } else {
                sortedActions.append(cancelAction)
            }
        }

        let buttons = sortedActions.enumerated().map { index, action -> KRAlertButton in
            let button = KRAlertButton(frame: buttonFrame(index: index), action: action, type: type)
            button.addTarget(self, action: #selector(KRAlertContentView.actionButtonTapped(_:)), for: .touchUpInside)
            return button
        }
        return buttons
    }
}


/**
 *  Button actions --------------------
 */
extension KRAlertContentView {
    func actionButtonTapped(_ button: KRAlertButton) {
        delegate?.didSelectActionButton(action: button.action)
    }
}
