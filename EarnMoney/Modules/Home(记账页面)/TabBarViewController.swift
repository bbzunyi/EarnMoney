//
//  ViewController.swift
//  EarnMoney
//
//  Created by bb on 2022/2/5.
//

import UIKit

class TabBarViewController: UITabBarController {

    var addItemDelegate:AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
        for controller in self.viewControllers ?? [] {
            if let view = controller as? ChooseTypeViewController{
                view.addItemDelegate = self.addItemDelegate
            }
            
        }
       // UITabBarController MyController = self.tabBarController
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
