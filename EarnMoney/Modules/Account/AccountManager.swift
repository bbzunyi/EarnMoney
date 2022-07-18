//
//  AccountManager.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/15.
//

import RxSwift
import RxCocoa
import NSObject_Rx
import MBProgressHUD
import SVProgressHUD

import Foundation

struct AccountInfo : Codable {

    let admin : Bool?
    let chapterTops : [Int]?
    var collectIds : [Int]?
    let email : String?
    let icon : String?
    let id : Int?
    let nickname : String?
    var password : String?
    let publicName : String?
    let token : String?
    let type : Int?
    var username : String?
}

final class AccountManager {
    
    /// 单例
    static let shared = AccountManager()
    
    /// 对外只读是否登录属性
    private(set) var isLogin = false//BehaviorRelay(value: false)
        
    /// 对外只读用户信息属性
    private(set) var accountInfo: AccountInfo?
    
    /// 私有化初始化方法
    private init() {
        if autoLogin(){
            isLogin = true
            //isLogin.accept(true)
        }
    }
    
    
}

extension AccountManager {
    /// 已登录请求头处理
    var cookieHeaderValue: String {
        if let username = accountInfo?.username, let password = accountInfo?.password {
          return "loginUserName=\(username);loginUserPassword=\(password)";
        } else {
          return ""
        }
    }
}

extension AccountManager {
    /// 登录成功,保存登录信息
    func saveLoginUsernameAndPassword(username: String, password: String) {
        //accountInfo = info
        accountInfo?.username = username
        accountInfo?.password = password
        
        UserDefaults.standard.setValue(username, forKey: kUsername)
        UserDefaults.standard.setValue(password, forKey: kPassword)
        /// 需要注意赋值顺序,将info赋值给单例后,再改变isLogin的状态才能获取正确的请求头
        isLogin = true
    }
    
    /// 登出成功,清理登录信息
    func clearAccountInfo() {
        isLogin = false
        accountInfo = nil
        /// 不仅要清除内存,也要清除本地UserDefault保存的数据
        UserDefaults.standard.removeObject(forKey: kUsername)
        UserDefaults.standard.removeObject(forKey: kPassword)
    }
}


extension AccountManager {
    /// 获取本地保存用户名
    func getUsername() -> String? {
        return UserDefaults.standard.value(forKey: kUsername) as? String
    }
    
    /// 获取本地保存密码
    func getPassword() -> String? {
        return UserDefaults.standard.value(forKey: kPassword) as? String
    }
    
    /// 自动登录
    func autoLogin() -> Bool {
        if !isLogin {
            guard let username = getUsername(), let password = getPassword() else {
                return false
            }
           // login(username: username, password: password, showLoading: false)
            return true
        }
        return true
    }
    
    /// 调用登录接口
    func login(username: String, password: String, showLoading: Bool = true) {
        
        let message :String
        AccountManager.shared.saveLoginUsernameAndPassword(username: username, password: password)
        message = "登录成功"
                
        guard showLoading else {
            return
        }
        
//        DispatchQueue.main.async {
//            SVProgressHUD.showText(message)
//        }

    }
}


extension AccountManager {
    
}

extension AccountManager: HasDisposeBag {}

