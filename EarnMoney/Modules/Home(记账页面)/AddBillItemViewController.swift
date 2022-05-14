//
//  AddBillItemViewController.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/3/5.
//

import UIKit
 
//protocol AddPaymentDelegate {
//    func addItem(item:TallyItem, date:Date)
//}
//
//protocol AddIncomeDelegate {
//    func addItem(item:TallyItem, date:Date)
//}

protocol AddItemDelegate {
    func addItem(item:TallyItem, date:String)
}

protocol EditItemDelegate {
    func editItem(new_item:TallyItem, new_date:String, date:String, row:Int)
}


class AddBillItemViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var remarkText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    
//    var addPaymentDelegate: AddPaymentDelegate?
//    var addIncomeDelegate: AddIncomeDelegate?
    var addItemDelegate: AddItemDelegate?
    var editItemDelegate: EditItemDelegate?
    var tally_type:String?
    var type:Int?
    var image:UIImage?
    var money:Double?
    var remark:String?
    var  date:Date?
    var dateString:String?
    var row:Int?
    var editItem:TallyItem?
    var old_date:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.white
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        self.date = Date()
        dateString = dateFormatter.string(from: self.date!)
        self.dateText.text = dateString
        
        self.priceText.keyboardType = .decimalPad
        
        self.remarkText.clearButtonMode = .whileEditing
        self.priceText.clearButtonMode = .whileEditing
        self.dateText.text! = self.old_date ?? dateString!
        self.remarkText.text! = self.remark ?? ""
        if self.money != nil{
            self.priceText.text! = String(self.money!)
        }
        self.dateText.addDatePicker(target: self, doneAction: #selector(doneAction), cancelAction: #selector(cancelAction))
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        remarkText.resignFirstResponder()
        priceText.resignFirstResponder()

        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        remarkText.resignFirstResponder()
        priceText.resignFirstResponder()
    }

    @IBAction func cancle(_ sender: Any) {
        
        self.navigationController?.popViewController( animated: true);
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func done(_ sender: Any) {
        
        let newItem = TallyItem(type: self.type!, tally_type: self.tally_type!, money: Double(priceText.text!)!, remark: remarkText.text!, image: self.image!)
        if editItem == nil{
            self.addItemDelegate?.addItem(item: newItem, date: self.dateText.text!)
        }else{
            self.editItemDelegate?.editItem(new_item: newItem, new_date: self.dateText.text! ?? "nil",date: old_date!, row: row ?? 0)
        }

        self.navigationController?.popToRootViewController(animated: true)
        
        self.navigationController?.navigationBar.isHidden = false
    }

    
    
    @objc
    func cancelAction() {
        self.dateText.resignFirstResponder()
    }

    @objc
    func doneAction() {
        if let datePickerView = self.dateText.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd"
            self.date = datePickerView.date
           dateString = dateFormatter.string(from: datePickerView.date)
            self.dateText.text = dateString
            self.dateText.resignFirstResponder()
        }
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

extension UITextField{
    func addDatePicker<T>(    target: T,
                          doneAction: Selector,
                          cancelAction: Selector
                            ) {
        func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            let buttonTarget = style == .flexibleSpace ? nil : target
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style,
                                                target: buttonTarget,
                                                action: action)
            
            return barButtonItem
        }
        
        let datePicker = UIDatePicker.init(frame: CGRect(origin: CGPoint(x: 0, y: (UIScreen.main.bounds.height - 216) / 2), size: CGSize(width: UIScreen.main.bounds.width, height: 216)))
        datePicker.layer.borderWidth = 1
        datePicker.layer.borderColor = UIColor.gray.cgColor
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        datePicker.locale = Locale(identifier: Locale.current.identifier)//根据系统设备选择语言
        self.inputView = datePicker
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.width,
                                              height: 44))
        toolBar.setItems([buttonItem(withSystemItemStyle: .cancel),
                          buttonItem(withSystemItemStyle: .flexibleSpace),
                          buttonItem(withSystemItemStyle: .done)],
                         animated: true)
        self.inputAccessoryView = toolBar
        // Code goes here
       }
}

func textField(_ textField: UITextField,shouldChangeCharactersIn range:NSRange,replacementString string:String)->Bool{
    let oldText = textField.text!
    let stringRange = Range(range,in:oldText)!
    return true
}
