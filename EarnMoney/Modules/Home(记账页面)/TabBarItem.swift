//
//  TabBarItem.swift
//  EarnMoney
//
//  Created by aaaabang on 2022/2/9.
//

import UIKit

class TabBarItem: UITabBarItem {


        //choose initial state fonts and weights here
    let normalTitleFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.black)
    let selectedTitleFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)

        //choose initial state colors here
        let normalTitleColor = UIColor.systemCyan
        let selectedTitleColor = UIColor.systemBlue

    
        //assigns the proper initial state logic when each tab instantiates
        override func awakeFromNib() {
            super.awakeFromNib()
            
            //this tag # should be your primary tab's Tag*
            if self.tag == 1 {
                self.setTitleTextAttributes([NSAttributedString.Key.font: selectedTitleFont, NSAttributedString.Key.foregroundColor: selectedTitleColor], for: UIControl.State.selected)
            } else {
                self.setTitleTextAttributes([NSAttributedString.Key.font: normalTitleFont,NSAttributedString.Key.foregroundColor: normalTitleColor], for: UIControl.State.normal)
                                            
            }

        }

    
}
