//
//  TodayViewData.swift
//  BridgeableModel
//
//  Created by YukiOkudera on 2018/09/30.
//  Copyright © 2018 YukiOkudera. All rights reserved.
//

import Foundation

public final class TodayViewData: NSObject {
    
    private static let msg = "MSG"
    private static let todayExBundleID = "group.jp.yuoku.iOSTodayExtensionGroup"
    
    public static func saveMessage(message: String) {
        
        let ud = UserDefaults(suiteName: todayExBundleID)
        ud?.set(message, forKey: msg)
        print("saved message: \(message)")
    }
    
    public static func fetchMessage() -> String? {
        
        let ud = UserDefaults(suiteName: todayExBundleID)
        let message = ud?.string(forKey: msg)
        print("fetched message: \(message ?? "")")
        return message
    }
}
