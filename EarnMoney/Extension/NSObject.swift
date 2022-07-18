//
//  NSObject.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/16.
//

import Foundation

// MARK: - 获取类的字符串名称
extension NSObject {
    
    /// 对象获取类的字符串名称
    public var className: String {
        return runtimeType.className
    }
    
    /// 类获取类的字符串名称
    public static var className: String {
        return String(describing: self)
    }
    
    /// NSObject对象获取类型
    public var runtimeType: NSObject.Type {
        return type(of: self)
    }
}
