//
//  ViewController.swift
//  iOSTodayExtension
//
//  Created by YukiOkudera on 2018/09/30.
//  Copyright © 2018 YukiOkudera. All rights reserved.
//

import UIKit
import BridgeableModel

final class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }

    // MARK: - IBAction

    @IBAction func didTapUpdate(_ sender: UIButton) {
        print(#function)
        TodayViewData.saveMessage(message: textField.text ?? "")
    }
}
