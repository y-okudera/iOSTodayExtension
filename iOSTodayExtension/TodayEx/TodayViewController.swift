//
//  TodayViewController.swift
//  TodayEx
//
//  Created by YukiOkudera on 2018/09/30.
//  Copyright © 2018 YukiOkudera. All rights reserved.
//

import UIKit
import NotificationCenter
import BridgeableModel

final class TodayViewController: UIViewController {

    /// widgetのラベル
    @IBOutlet weak var label: UILabel!

    /// widgetを広げた時の高さ
    let expandedContentHeight = 200

    override func viewDidLoad() {
        super.viewDidLoad()
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
}

extension TodayViewController: NCWidgetProviding {

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        label.text = TodayViewData.fetchMessage()
        completionHandler(NCUpdateResult.newData)
    }

    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        switch activeDisplayMode {
        case .compact:
            preferredContentSize = maxSize
        case .expanded:
            preferredContentSize = CGSize(width: 0, height: expandedContentHeight)
        }

        // iOSTodayExtension(Containing App)実行時は、以下のデバッグログはコンソールに表示されない
        print("NCWidgetDisplayMode: \(activeDisplayMode)")
        print("preferredContentSize: \(preferredContentSize)")
    }
}
