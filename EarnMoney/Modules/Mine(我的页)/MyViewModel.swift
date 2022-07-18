//
//  File.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/15.
//

import Foundation

import RxSwift
import RxCocoa
import NSObject_Rx

class MyViewModel{
    
    //Base Model
    var inputs: Self { return self }

    /// outputs修饰前缀
    var outputs: Self { return self }
    
    /// 模型名称
    var className: String { String(describing: self) }
    
    deinit {

    }
    
    
    let currentDataSource = BehaviorRelay<[My]>(value: [])

    
    init() {
//        /// 单例的myCoin与VM的myCoin进行绑定
//        AccountManager.shared.myCoin.bind(to: myCoin).disposed(by: disposeBag)
//
        /// 单例的isLogin通过map后,与VM的currentDataSource进行绑定
//        AccountManager.shared.isLogin
//            .map { isLogin in
//                isLogin ? MyViewModel.loginDataSource : MyViewModel.logoutDataSource
//            }
//            .bind(to: currentDataSource)
    }
}

extension MyViewModel {
//    func getMyCoin() -> Single<BaseModel<CoinRank>> {
//        return myProvider.rx.request(MyService.userCoinInfo)
//            .map(BaseModel<CoinRank>.self)
//
//    }
    
//    func logout() -> Single<BaseModel<String>> {
//        return accountProvider.rx.request(AccountService.logout)
//            .map(BaseModel<String>.self)
//    }
}

extension MyViewModel {
    static let logoutDataSource: [My] = [.about, .login]
    
    static let loginDataSource: [My] = [.about, .logout]
}
