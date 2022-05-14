//
//  ChooseTypeViewController.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/3/5.
//

import UIKit


class ChooseTypeViewController: UIViewController{

    var addItemDelegate:AddItemDelegate?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier! == "payment"{
            let addItemViewController = segue.destination as! AddBillItemViewController
            
            addItemViewController.addItemDelegate = self.addItemDelegate
            if((sender as! UIButton) == nil){
                print("wrong")
            }
            let btn  = sender as! UIButton
            addItemViewController.tally_type = btn.titleLabel?.text!
            addItemViewController.image = (sender as! UIButton).imageView?.image
            addItemViewController.type = 0;
        }
        else if segue.identifier! == "income"{
            let addItemViewController = segue.destination as! AddBillItemViewController
            
            addItemViewController.addItemDelegate = self.addItemDelegate
            let btn  = sender as! UIButton
            addItemViewController.tally_type = btn.titleLabel?.text!
            addItemViewController.image = (sender as! UIButton).imageView?.image
            addItemViewController.type = 1;
        }
    }

}

