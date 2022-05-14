//
//  TallyViewController.swift
//  EarnMoney
//
//  Created by bb on 2022/2/6.
//

import UIKit
import MonthYearPicker
import Charts
import Foundation

class TallyViewController: UIViewController{

    @IBOutlet weak var IncomeLabel: UILabel!
    @IBOutlet weak var ExpendLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var ChartButton: UIButton!
    @IBOutlet weak var TallyButton: UIButton!
    
    var piechartview:PieChartView = PieChartView.init(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 500))
    var o_piechartview:PieChartView = PieChartView.init(frame: CGRect(x: 0, y: 1300, width: UIScreen.main.bounds.width, height: 500))
    var barchartview:BarChartView = BarChartView.init(frame: CGRect(x: 0, y: 700, width: UIScreen.main.bounds.width, height: 400))
    var o_barchartview:BarChartView = BarChartView.init(frame: CGRect(x: 0, y: 2000, width: UIScreen.main.bounds.width, height: 400))
    var tableView:UITableView?
    var scrollview:UIScrollView?
    var items:[String:[TallyItem]] = [:]
    var dates:[String] = [] //["2022.2.9","2022.2.8","2022.2.7"]
    //var items:[Date:TallyItem] = [:]
    
    var addButton:UIButton?
    func get_items()->[String:[TallyItem]]{
        return items;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        items["2022.2.9"] = [TallyItem(type: 0, tally_type: "购物", money: 10000, remark: "爽肤水0"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水1")]
//        items["2022.2.8"] = [TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水1"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水2")]
//        items["2022.2.7"] = [TallyItem(type: 1, tally_type: "购物", money: 100, remark: "兼职"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水4"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水1"),TallyItem(type: 0, tally_type: "购物", money: 100, remark: "爽肤水2")]
        loadItem()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM"
        let dateString = dateFormatter.string(from: Date())
        self.textField.text = dateString
        self.ExpendLabel.textAlignment = .left
        self.IncomeLabel.textAlignment = .left
        countIncomeAndExpense()
        self.textField.addTarget(  target:self,
                         doneAction: #selector(doneAction),
                         cancelAction: #selector(cancelAction)
                        )
        self.TouchTallyButton(self)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView?.reloadData()
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @IBAction func TouchTallyButton(_ sender: Any) {
        TallyButton.backgroundColor = UIColor.systemPurple
        TallyButton.setTitleColor(.white, for: .normal)
        ChartButton.backgroundColor = UIColor.white
        ChartButton.setTitleColor(UIColor.systemBlue, for: .normal)
        tableView = UITableView(frame: CGRect(x: 0, y: 320, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-420), style: UITableView.Style.plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.register(TallyTableViewCell.self, forCellReuseIdentifier: "TallyCell")
        
        
        
        self.view.addSubview(tableView!)
        addButtonToView()
       // self.BottomView.addSubview(my_tableview.tableView)
    }

    
    func addButtonToView(){
        addButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width-80,y:UIScreen.main.bounds.height-180,width: 80, height: 80))
//        addButton = UIButton(type: UIButton.ButtonType.custom)
//        addButton?.imageView?.frame = CGRect(x: UIScreen.main.bounds.width-80,y:UIScreen.main.bounds.height-180,width: 200, height: 200)
        addButton?.imageView?.isHidden = false;
        let button_image = self.resizeImage(image: UIImage(named: "add")!, targetSize: CGSize(width: 50, height: 50))
        addButton?.setImage(button_image, for: UIControl.State.normal)
        print(addButton?.imageView)
        //addButton?.imageView!.isExclusiveTouch = true
        addButton?.addTarget(self, action: #selector(clickAddButton), for: UIControl.Event.touchUpInside)
        self.view?.addSubview(addButton!)
    }
    
    @objc
    func clickAddButton(){
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         guard let threeVC = storyboard.instantiateViewController(withIdentifier: "addBillTab") as? TabBarViewController else {  return }
        threeVC.addItemDelegate = self
        
        guard let addBill = storyboard.instantiateViewController(withIdentifier: "addIncomeBill") as? ChooseTypeViewController else {  return }
        addBill.addItemDelegate = self
        
        guard let addBill = storyboard.instantiateViewController(withIdentifier: "addPayBill") as? ChooseTypeViewController else {  return }
        addBill.addItemDelegate = self
        
         self.navigationController?.pushViewController(threeVC, animated: true)
    }
    func countIncomeAndExpense(){
        let date:String = textField.text!
        var income:Double = 0
        var expense:Double = 0
        for date_item in self.items.keys{
            if date_item.hasPrefix(date) {
                for item in items[date_item]!{
                    if item.type == 0{
                        expense += item.money
                    }else{
                        income += item.money
                    }
                }
            }
        }
        IncomeLabel.text! = "收入：" + String(income)
        ExpendLabel.text! = "支出：" + String(expense)
    }
    
    @IBAction func TouchChartButton(_ sender: Any) {
        TallyButton.backgroundColor = UIColor.white
        TallyButton.setTitleColor(.systemBlue, for: .normal)
        ChartButton.backgroundColor = UIColor.systemPurple
        ChartButton.setTitleColor(.white, for: .normal)
        var values:[Double] = []
        var names:[String] = []
        var o_values:[Double] = []
        var o_names:[String] = []
        var dic:[String:Double] = [:]
        var o_dic:[String:Double] = [:]
        let date = textField.text!
        for date_item in self.items.keys{
            if date_item.hasPrefix(date) {
                for item in items[date_item]!{
                    if item.type == 0{
                        if dic.keys.contains(item.tally_type){
                            dic[item.tally_type]! += item.money
                        }else{
                            dic[item.tally_type] = item.money
                        }
                    }else{
                        if o_dic.keys.contains(item.tally_type){
                            o_dic[item.tally_type]! += item.money
                        }else{
                            o_dic[item.tally_type] = item.money
                        }
                    }
                }
            }
        }
        for item in dic{
            names.append(item.key)
            values.append(item.value)
        }
        for item in o_dic{
            o_names.append(item.key)
            o_values.append(item.value)
        }
        scrollview =  UIScrollView(frame: CGRect(x: 0, y: 320, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-420))
        scrollview?.backgroundColor = .systemBlue
                // Set the contentSize to 100 times the height of the phone's screen so that we can add 100 images in the next step
        scrollview?.contentSize = CGSize(width: (scrollview?.contentSize.width)!, height: 2500)//UIScreen.main.bounds.height*10)
        piechartview.data = customizeChart(dataPoints: names, values: values.map{ Double($0) },type: 0)
        o_piechartview.data = customizeChart(dataPoints: o_names, values: o_values.map{ Double($0) },type: 1)
        barchartview.data = customizeBarChart(dataPoints: names, values: values.map{ Double($0) },type: 0)
        o_barchartview.data = customizeBarChart(dataPoints: o_names, values: o_values.map{ Double($0) },type: 1)
        //piechartview.centerText = "支出"
        let font = UIFont.systemFont(ofSize: 45)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.systemBlue
        shadow.shadowBlurRadius = 5

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.systemPurple,
            .shadow: shadow
        ]
        let attributedQuote = NSAttributedString(string:"支出", attributes: attributes)
        let o_attributedQuote = NSAttributedString(string:"收入", attributes: attributes)
        piechartview.centerAttributedText = attributedQuote
        o_piechartview.centerAttributedText = o_attributedQuote
        scrollview?.addSubview(piechartview)
        scrollview?.addSubview(o_piechartview)
        scrollview?.addSubview(barchartview)
        scrollview?.addSubview(o_barchartview)
        self.tableView?.removeFromSuperview()
        self.addButton?.removeFromSuperview()
        self.view.addSubview(scrollview!)
    }
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(180 + arc4random_uniform(76))
        let blue = Double(200 + arc4random_uniform(56))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }
    func customizeBarChart(dataPoints: [String], values: [Double], type:Int)->BarChartData
    {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
          let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
          dataEntries.append(dataEntry)
        }
        var chartDataSet:BarChartDataSet
        if type == 0{
            chartDataSet = BarChartDataSet(entries: dataEntries, label:"支出")
        }else{
            chartDataSet = BarChartDataSet(entries: dataEntries, label:"收入")
        }
        chartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        let chartData = BarChartData(dataSet: chartDataSet)
        var xAxis:XAxis
        var chartView:BarChartView
        if type == 0{
            xAxis = barchartview.xAxis
            chartView = barchartview
        }else{
            xAxis = o_barchartview.xAxis
            chartView = o_barchartview
        }
        chartView.highlightPerTapEnabled = true
        chartView.highlightFullBarEnabled = true
        chartView.highlightPerDragEnabled = false
        
        // disable zoom function
        chartView.pinchZoomEnabled = false
        chartView.setScaleEnabled(false)
        chartView.doubleTapToZoomEnabled = false

        // Bar, Grid Line, Background
        chartView.drawBarShadowEnabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.drawBordersEnabled = false
        
        // Legend
        chartView.legend.enabled = false
        let leftAxis = chartView.leftAxis
        chartView.rightAxis.enabled = false
        leftAxis.axisMinimum = 0.0
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = false
        xAxis.granularityEnabled = false
        xAxis.labelRotationAngle = -25
        xAxis.setLabelCount(dataPoints.count, force: false)
        xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        xAxis.axisMaximum = Double(dataPoints.count)
//        xAxis.axisLineColor = .chartLineColour
//        xAxis.labelTextColor = .chartLineColou
       return chartData
    }
    func customizeChart(dataPoints: [String], values: [Double], type:Int)->PieChartData{
        // 1. Set ChartDataEntry
          var dataEntries: [ChartDataEntry] = []
          for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
          }
          // 2. Set ChartDataSet
        var pieChartDataSet:PieChartDataSet
        if type == 0{
            pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "支出")
        }else{
            pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "收入")
        }
          pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
          // 3. Set ChartData
          let pieChartData = PieChartData(dataSet: pieChartDataSet)
          let format = NumberFormatter()
          format.numberStyle = .none
          let formatter = DefaultValueFormatter(formatter: format)
          pieChartData.setValueFormatter(formatter)
          // 4. Assign it to the chart’s data
         return pieChartData
    }
    
    @objc
    func cancelAction() {
        self.textField.resignFirstResponder()
    }

    @objc
    func doneAction() {
        if let datePickerView = self.textField.inputView as? MonthYearPickerView {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.textField.text = dateString
            self.textField.resignFirstResponder()
            countIncomeAndExpense()
            TouchChartButton(self)
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

extension TallyViewController:UITableViewDataSource,UITableViewDelegate{

    // MARK: - Table view data source
    func sortDate(date:Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let result = dateFormatter.string(from: date)
        guard items.keys.contains(result) else{
            dates.append(result)
            dates = dates.sorted(by: {$0>$1})
            return
        }
    }
    func Date2String(date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let result = dateFormatter.string(from: date)
        return result
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      //  print(self.items.count)
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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
            //print(outStr)
        }
        let end_str:String = inStr + "   " + outStr
        if out == true && income == true{
            return dates[section] + "                 " + end_str
        }else{
            return dates[section] + "                                          " + end_str
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print(Date2String(date: Date()))
        let rows = self.items[dates[section]]
        return rows?.count ?? 0
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TallyCell") as! TallyTableViewCell
        let tallys = self.items[dates[indexPath.section]]
//       cell.TallyImage.image = self.resizeImage(image: UIImage(named: tallys![indexPath.row].tally_type)!, targetSize: CGSize(width: 40, height: 40))
       cell.TallyImage.image = self.resizeImage(image:  tallys![indexPath.row].image!, targetSize: CGSize(width: 40, height: 40))
        cell.remark.text = tallys![indexPath.row].remark
        var sym:String = " "
        if tallys![indexPath.row].type == 0{
            sym = "-"
        }
        cell.money.text = sym + String(tallys![indexPath.row].money)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let threeVC = storyboard.instantiateViewController(withIdentifier: "EditWindow") as? AddBillItemViewController else {  return }
        threeVC.addItemDelegate = self
        threeVC.editItemDelegate = self
        threeVC.row = indexPath.row
        threeVC.old_date = dates[indexPath.section]
        let tally_item = items[dates[indexPath.section]]![indexPath.row]
        threeVC.type = tally_item.type
        threeVC.tally_type = tally_item.tally_type
        threeVC.remark = tally_item.remark
        threeVC.money = tally_item.money
        threeVC.image = tally_item.image
//        threeVC.dateText.text! = dates[indexPath.section]
//        threeVC.remarkText.text! = tally_item.remark
//        threeVC.priceText.text! = String(tally_item.money)
        threeVC.editItem = tally_item
        self.navigationController?.pushViewController(threeVC, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
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
        self.tableView?.reloadData()
        countIncomeAndExpense()
        //print("Delete")
    }
}
extension UITextField{
    func addTarget<T>(    target: T,
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
        let picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x: 0, y: (UIScreen.main.bounds.height - 216) / 2), size: CGSize(width: UIScreen.main.bounds.width, height: 216)))
//        picker.minimumDate = Date()
//        picker.maximumDate = Calendar.current.date(byAdding: .year, value: 10, to: Date())
        self.inputView = picker
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

extension TallyViewController:AddItemDelegate{
    func addItem(item: TallyItem, date: String) {
        if items[date] == nil {
            items[date] = []
        }
        if item.remark == ""{
            item.remark = item.tally_type
        }
        items[date]?.append(item)
        if !dates.contains(date){
            dates.append(date)
        }
        countIncomeAndExpense()
        self.dates = self.dates.sorted(by: {$0>$1})
        self.tableView?.reloadData()
    }
    
    
}

extension TallyViewController:EditItemDelegate{
    func editItem(new_item: TallyItem, new_date: String, date: String, row: Int) {
        if items[date]?.count == 1{
            self.items.removeValue(forKey: date)
            var i:Int = 0
            var index:Int = 0
            for d in dates{
                if d == date{
                    index = i
                    break
                }
                i += 1
            }
            self.dates.remove(at:index)
        }else{
            self.items[date]?.remove(at: row)
        }
        addItem(item: new_item, date: new_date)
    }
}
extension TallyViewController{
    func dataFilePath()->URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return path!.appendingPathComponent("earnmoney.json")
    }
    
    func saveAllItems(){
        do{
            var encode_items:[String:[String?]] = [:]
            for item in items{
                for tally_item in item.value{
                    let one_image = tally_item.image!
                    let imagedata = one_image.jpegData(compressionQuality: 1)
                    let imageBase64String = imagedata?.base64EncodedString()
                    let save_string = imageBase64String! + "," + String(tally_item.type) + "," + tally_item.tally_type + "," + String(tally_item.money) + "," + tally_item.remark
                    if encode_items.keys.contains(item.key) == false{
                        encode_items[item.key] = [save_string]
                    }else{
                        encode_items[item.key]!.append(save_string)
                    }
                }
            }
          let data = try JSONEncoder().encode(encode_items)
          try data.write(to: dataFilePath(),options: .atomic)
        }catch{
            print("Can not save: \(error.localizedDescription)")
        }
    }
    
    func loadItem(){
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path){
            do{
                var encode_items:[String:[String?]] = [:]
                encode_items = try JSONDecoder().decode([String:[String?]].self, from: data)
                for item in encode_items{
                    if !dates.contains(item.key){
                        dates.append(item.key)
                    }
                    for tally_item in item.value{
                        let strings = NSString(string: tally_item!).components(separatedBy: ",")
                        let newImageData = Data(base64Encoded: strings[0])
                        let one_image:UIImage = UIImage(data: newImageData!)!
                        let tally = TallyItem(type: Int(strings[1])!, tally_type: strings[2], money: Double(strings[3])!, remark: strings[4], image: one_image)
                        if items.keys.contains(item.key) == false{
                            items[item.key] = [tally]
                        }else{
                            items[item.key]!.append(tally)
                        }
                    }
                    
                }
                dates = dates.sorted(by: {$0>$1})
            } catch{
                print("Error decoding list:\(error.localizedDescription)")
            }
        }
    }
}//持久化数据
