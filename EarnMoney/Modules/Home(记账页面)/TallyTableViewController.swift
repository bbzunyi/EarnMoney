//
//  TallyTableViewController.swift
//  EarnMoney
//
//  Created by bb on 2022/2/9.
//

import UIKit


class TallyTableViewController: UITableViewController {
    var items:[String:[TallyItem]] = [:]
    var dates:[String] = ["2022.2.9","2022.2.8","2022.2.7"]
    override func viewDidLoad() {
//        items["2022.2.9"] = [TallyItem(type: 0, tally_type: "购物", money: 10000, remark: "爽肤水0"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水1")]
//        items["2022.2.8"] = [TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水1"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水2")]
//        items["2022.2.7"] = [TallyItem(type: 1, tally_type: "购物", money: 100, remark: "兼职"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水4"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水1"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水2")]
        self.sortDate(date: Date())
        super.viewDidLoad()
        self.tableView.reloadData()
        
        self.navigationController?.navigationBar.isHidden = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    func sortDate(date:Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let result = dateFormatter.string(from: date)
        guard items.keys.contains(result) else{
            dates.append(result)
            dates.sorted(by: {$0>$1})
            return
        }
    }
    func Date2String(date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let result = dateFormatter.string(from: date)
        return result
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      //  print(self.items.count)
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let tallys:[TallyItem]? = self.items[dates[section]]
        var out:Bool = false
        var income:Bool = false
        var outValue:Double = 0
        var inValue:Double = 0
        for tally in tallys!{
            if tally.type == 0{
                out = true
                outValue += tally.money
            }else{
                income = true
                inValue += tally.money
            }
        }
        var outStr:String = ""
        var inStr:String = ""
        if income == true{
            inStr = "收入:" + String(inValue)
        }
        if out == true{
            outStr = "支出:" + String(outValue)
            print(outStr)
        }
        let end_str:String = inStr + " " + outStr
//        if out == true && income == true{
//            return dates[section] + "   " + end_str
//        }else{
//            return dates[section] + " " + end_str
//        }
        return "1";
    }
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        let tallys:[TallyItem]? = self.items[dates[section]]
//        var out:Bool = false
//        var income:Bool = false
//        var outValue:Int = 0
//        var inValue:Int = 0
//        for tally in tallys!{
//            if tally.type == 0{
//                out = true
//                outValue += tally.money
//            }else{
//                income = true
//                inValue += tally.money
//            }
//        }
//        var outStr:String = ""
//        var inStr:String = ""
//        if income == true{
//            inStr = "收入:" + String(inValue)
//        }
//        if out == true{
//            outStr = "支出:" + String(outValue)
//            print(outStr)
//        }
//        return inStr + " " + outStr
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(Date2String(date: Date()))
        let rows = self.items[dates[section]]
        return rows?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TallyCell") as! TallyTableViewCell
        let tallys = self.items[dates[indexPath.section]]
            cell.TallyImage.image = UIImage(named: tallys![indexPath.row].tally_type)
        cell.remark.text = tallys![indexPath.row].remark
        var sym:String = " "
        if tallys![indexPath.row].type == 0{
            sym = "-"
        }
        cell.money.text = sym + String(tallys![indexPath.row].money)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
                            indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive,
                                       title: "Delete") { [weak self] (action, view, completionHandler) in
            self?.handleDelete(section: indexPath.section,row: indexPath.row)
                                        completionHandler(true)
        }
        delete.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    private func handleDelete(section: Int, row: Int) {
        if items[dates[section]]?.count == 1{
            self.items.removeValue(forKey: dates[section])
            self.dates.remove(at: section)
        }else{
            self.items[dates[section]]?.remove(at: row)
        }
        self.tableView.reloadData()
        //print("Delete")
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
