//
//  MyViewController.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/15.
//

import UIKit

import RxSwift
import RxCocoa
//import MBProgressHUD
import SVProgressHUD
import DZNEmptyDataSet

class MyController: UIViewController{
    
    var tableView:UITableView?
    var show_items:[String] = ["fail"]
    let login:[String] = ["关于我们","登出"]
    let logout:[String] = ["关于我们","登录"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //AccountManager.shared.autoLogin()
    }
    
    private func setupUI() {
        
        checkLogin()
        
        tableView = UITableView(frame: CGRect(x: 0, y: kScreenWidth_9_16+10, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-420), style: UITableView.Style.plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.register(MyTableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        let myView = MyHeadView(frame: CGRect(x: 0, y: 50, width: kScreenWidth, height: kScreenWidth_9_16))
        //myView.backgroundColor = .blue
       
        
        
        
        self.view.addSubview(myView)
        self.view.addSubview(tableView!)
        self.view.backgroundColor = .white
        
    }
    
    private func checkLogin() {
        let isLogin = AccountManager.shared.isLogin
        if isLogin{
            show_items = login
        } else{
            show_items = logout
        }
        self.tableView?.reloadData()
    }
}

    

extension MyController {
    
    override func viewWillAppear(_ animated: Bool) {
        checkLogin()
    }
    
    private func logoutAction() {
        let alertController = UIAlertController(title: "提示", message: "是否确定退出登录?", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "取消", style: .destructive) { (action) in
            
        }
        let actionOK = UIAlertAction(title: "确定", style: .default) { [self] (action) in
            
            AccountManager.shared.clearAccountInfo()
            //AccountManager.shared.myCoin.accept(nil)
//            DispatchQueue.main.async {
//                SVProgressHUD.showText("退出登录成功")
//            }
            
            self.show_items = self.logout
            self.tableView?.reloadData()
        }
        alertController.addAction(actionCancel)
        alertController.addAction(actionOK)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension MyController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.show_items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyTableViewCell
        cell.title.text = show_items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyTableViewCell
        let title = show_items[indexPath.row]
        
        switch title {
        case "关于我们": break
        case "登录":
            let threeVC = LoginController()
            self.navigationController?.pushViewController(threeVC, animated: true)
            
            break
        case "登出":
            self.logoutAction()
//            AccountManager.shared.clearAccountInfo()
//            //AccountManager.shared.myCoin.accept(nil)
//            DispatchQueue.main.async {
//                SVProgressHUD.showText("退出登录成功")
//            }
//
//            self.show_items = self.logout
//            self.tableView?.reloadData()
            break
        default:
            return
            
        }
    }
}
