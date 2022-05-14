//
//  TallyItem.swift
//  EarnMoney
//
//  Created by bb on 2022/2/9.
//

import UIKit

//class TallyItem: NSObject {
//    var type:Int //支出or收入 0 or 1
//    var tally_type:String//记账的种类
//    var money:Int//金额
//    var remark:String//备注（自定义名字）
//   // var image:UIImage //素材图片
//
//    init(type:Int,tally_type:String,money:Int,remark:String){
//        self.type = type
//        self.tally_type = tally_type
//        self.money = money
//        self.remark = remark
//       // self.image = image
//    }
//
//}

import UIKit

class TallyItem: NSObject {
    var type:Int //支出or收入 0 or 1
    var tally_type:String//记账的种类
    var money:Double//金额
    var remark:String//备注（自定义名字）
    var image:UIImage? //素材图片
    
    init(type:Int,tally_type:String,money:Double,remark:String,image:UIImage){
        self.type = type
        self.tally_type = tally_type
        self.money = money
        self.remark = remark
        self.image = image
    }
    
    
//    init(type:Int,tally_type:String,money:Double,remark:String){
//        self.type = type
//        self.tally_type = tally_type
//        self.money = money
//        self.remark = remark
//    }
}
