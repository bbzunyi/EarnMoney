//
//  MyInfo.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/15.
//


import UIKit

enum My: CaseIterable {

    case about
    case login
    case logout
}

extension My {
    var title: String {
        let string: String
        switch self {
        case .about:
            string = "关于我们"
        case .login:
            string = "登录"
        case .logout:
            string = "登出"
        }
        return string
    }
    
    var imageName: String? {
        return nil
    }
        
    var path: String {
        let string: String
        switch self {
        case .about:
            string = "AboutViewController"
        case .login:
            string = "MyLoginController"
        case .logout:
            string = "Logout"
        }
        return string
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        switch self {
        case .logout:
            return .none
        default:
            return .disclosureIndicator
        }
    }
    
    var layout: (UITableViewCell) -> Void {
        return { cell in
            if self == .logout {
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.snp.makeConstraints({ make in
                    make.edges.equalTo(cell)
                })
            }
            
        }
    }
}
