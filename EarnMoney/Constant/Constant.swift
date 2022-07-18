//
//  Costant.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/15.
//
import UIKit

/// 状态栏的高度(竖屏限定)
let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

/// 导航栏的高度(竖屏限定)
let kNavigationBarHeight: CGFloat = 44.0

/// 整体顶部间距(竖屏限定)
let kTopMargin = kStatusBarHeight + kNavigationBarHeight

/// 屏宽
let kScreenWidth = UIScreen.main.bounds.width

/// 屏宽的9/16
let kScreenWidth_9_16 = UIScreen.main.bounds.width / 16.0 * 9

/// 保存用户名的key
let kUsername = "kUsername"

/// 保存密码的key
let kPassword = "kPassword"


/// 命名空间
let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String
