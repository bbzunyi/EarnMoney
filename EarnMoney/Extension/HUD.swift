//
//  HUD.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/15.
//

import Foundation

/// 弹窗协议,抹平MB和SV的用法
protocol HUD {
    /// 为啥不用start,因为容易混淆
    static func beginLoading()
    
    static func stopLoading()
    
    static func showText(_ text: String)
}
