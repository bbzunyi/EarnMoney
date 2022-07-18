//
//  JobDetailController.swift
//  EarnMoney
//
//  Created by bb on 2022/5/15.
//

import UIKit
import Foundation

protocol addJobDetailDelegate{
    func addjob(job:JobDetail)
}


class JobDetailController: UITableViewController {
    var type:Int = 0
    var strs:[String] = []
    var addjobdelegate:addJobDetailDelegate?
    let tableview: UITableView = {
            let tv = UITableView()
            tv.backgroundColor = UIColor.white
            tv.translatesAutoresizingMaskIntoConstraints = false
            tv.separatorColor = UIColor.white
            return tv
        }()
    var job_description:JobDetail?
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...14{
            strs.append("")
        }
        self.setupToHideKeyboardOnTapOnView()
        setupTableView()
    }

    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
//        searchbar.layer.borderWidth = 1
//        searchbar.layer.borderColor = UIColor.white.cgColor

       // searchbar.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 0)
        
        tableview.register(JobDetailCell.self, forCellReuseIdentifier: "DetailCell")
        tableview.register(ApplyCell.self, forCellReuseIdentifier: "ApplyCell")
        tableview.register(PublishCell.self, forCellReuseIdentifier: "PublishCell")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        switch section{
        case 0:
            return 12
        case 1:
            return 4
        default:
            return 5
        }
    }
  
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "基本信息📕"
        }else if section == 1{
            return "联系信息☎️"
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.systemFont(ofSize: 30)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let job:JobDetail = job_description ?? JobDetail()//JobDetail(jobname: "2021-2022历史学院办公室助理", jobtype: "长期岗位", firm_name: "历史系（学工办）", require_num: "3", salary: "22/小时", start_time: "2021-09-24", end_time: "2022-06-30", work_position: "历史学院228", work_description: "协助完成办公室日常工作", work_requirement: "每周至少有3个完整半天（工作日期间）能到岗值班", work_necessary_description: "1、为家境贫困的同学提供以劳动换取生活费用的机会，减少他们的经济压力。\n2、部分贫困同学由于经济条件等原因产生自卑情绪，人际交往较差，设置勤工助学岗促使该类同学走出宿舍、与人交往、学习基本的电脑操作技能等。\n3、院办公室、资料室及教务处日常工作事项较多，希望能有学生助理帮助解决一些材料收发处理等问题，同时培养学生的吃苦能力、责任心与耐心", work_peomeasure: "1、将未来职业技能（包括word、excel、ppt制作等技能）融入勤工助学岗，提升学生自身技能水平。2、坚持实践育人，将专业知识融入日常事务中。",contactor: "任玲玲" ,phone_number: "89685483", address: "历史系234")
        if type == 1{
            let cell = tableview.dequeueReusableCell(withIdentifier: "PublishCell") as! PublishCell
            cell.backgroundColor = UIColor.white
            cell.indexPath = indexPath
            cell.customdelegate1 = self
            if indexPath.section == 0{
                switch indexPath.row{
                case 0:
                    cell.Label.text = "岗位名称"
                case 1:
                    cell.Label.text = "岗位类型"
                case 2:
                    cell.Label.text = "单位名称"
                case 3:
                    cell.Label.text = "需求人数"
                case 4:
                    cell.Label.text = "薪酬标准"
                case 5:
                    cell.Label.text = "开始时间"
                case 6:
                    cell.Label.text = "结束时间"
                case 7:
                    cell.Label.text = "工作地点"
                case 8:
                    cell.Label.text = "岗位描述"
                case 9:
                    cell.Label.text = "岗位要求"
                case 10:
                    cell.Label.text = "岗位设置必要性说明"
                case 11:
                    cell.Label.text = "岗位育人措施及指导老师"
                default:
                    break;
                }
                return cell
            }else if indexPath.section == 1{
                switch indexPath.row{
                case 0:
                    cell.Label.text = "联系人"
                case 1:
                    cell.Label.text = "联系电话"
                case 2:
                    cell.Label.text = "联系地址"
                default:
                    let cell1 = tableview.dequeueReusableCell(withIdentifier: "ApplyCell") as! ApplyCell
                    cell1.separator(hide: true)
                    cell1.delegate = self
                    cell1.applyButton.setTitle("发布", for: .normal)
                    return cell1
                }
            }
            return cell
        }
        let cell = tableview.dequeueReusableCell(withIdentifier: "DetailCell") as! JobDetailCell
        cell.backgroundColor = UIColor.white
        if indexPath.section == 0{
            switch indexPath.row{
            case 0:
                cell.Label.text = "岗位名称"
                cell.Label1.text = job.jobname
            case 1:
                cell.Label.text = "岗位类型"
                cell.Label1.text = job.jobtype
            case 2:
                cell.Label.text = "单位名称"
                cell.Label1.text = job.firm_name
            case 3:
                cell.Label.text = "需求人数"
                cell.Label1.text = job.require_num
            case 4:
                cell.Label.text = "薪酬标准"
                cell.Label1.text = job.salary
            case 5:
                cell.Label.text = "开始时间"
                cell.Label1.text = job.start_time
            case 6:
                cell.Label.text = "结束时间"
                cell.Label1.text = job.end_time
            case 7:
                cell.Label.text = "工作地点"
                cell.Label1.text = job.work_position
            case 8:
                cell.Label.text = "岗位描述"
                cell.Label1.text = job.work_description
            case 9:
                cell.Label.text = "岗位要求"
                cell.Label1.text = job.work_requirement
            case 10:
                cell.Label.text = "岗位设置必要性说明"
                cell.Label1.text = job.work_necessary_description
            case 11:
                cell.Label.text = "岗位育人措施及指导老师"
                cell.Label1.text = job.work_peomeasure
            default:
                break;
            }
            
        }else if indexPath.section == 1{
            switch indexPath.row{
            case 0:
                cell.Label.text = "联系人"
                cell.Label1.text = job.contactor
            case 1:
                cell.Label.text = "联系电话"
                cell.Label1.text = job.phone_number
            case 2:
                cell.Label.text = "联系地址"
                cell.Label1.text = job.address
            default:
                let cell1 = tableview.dequeueReusableCell(withIdentifier: "ApplyCell") as! ApplyCell
                cell1.separator(hide: true)
                cell1.delegate = self
                cell1.applyButton.setTitle("申请", for: .normal)
               
                return cell1
            }
        }
        cell.separator(hide: false)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 && indexPath.section == 1{
            return 100
        }
        switch indexPath.row{
        case 0...7:
            return 50
        case 8...9:
            return 200
        case 10:
            return 300
        default:
            return 200
        }
    }
    
    

    

}

extension JobDetailController:AlertShower{
    func showAlert(TableCell:ApplyCell) {
        var alertController = UIAlertController(title: "系统提示",
                               message: "您确定要申请吗？", preferredStyle: .alert)
        if type == 1{
            alertController = UIAlertController(title: "系统提示",
                                   message: "您确定要发布吗？", preferredStyle: .alert)
        }
       let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
       let okAction = UIAlertAction(title: "确定", style: .default, handler: {
           action in
           print("点击了确定")
           if self.type == 1{
//               let indexpath:IndexPath = IndexPath(row: 0, section: 0)
//               var cell = self.tableView.cellForRow(at: indexpath) as! PublishCell
               let job_temp:JobDetail = JobDetail()
               job_temp.jobname = self.strs[0]
               job_temp.jobtype = self.strs[1]
               job_temp.firm_name = self.strs[2]
               job_temp.require_num = self.strs[3]
               job_temp.salary = self.strs[4]
               job_temp.start_time = self.strs[5]
               job_temp.end_time = self.strs[6]
               job_temp.work_position = self.strs[7]
               job_temp.work_description = self.strs[8]
               job_temp.work_requirement = self.strs[9]
               job_temp.work_necessary_description = self.strs[10]
               job_temp.work_peomeasure = self.strs[11]
               job_temp.contactor = self.strs[12]
               job_temp.phone_number = self.strs[13]
               job_temp.address = self.strs[14]
               self.addjobdelegate?.addjob(job: job_temp)
           }
       })
       alertController.addAction(cancelAction)
       alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
extension UIViewController
{
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

extension JobDetailController: UITextViewDelegate {
        
        func textViewDidChange(_ textView: UITextView) {
            // Refresh tableView cell
            if textView.numberOfLines > 2 { // textView in storyboard has two lines, so we match the design
                // Animated height update
                DispatchQueue.main.async {
                    self.tableView?.beginUpdates()
                    self.tableView?.endUpdates()
                }
            }
        }
    }

// 5) Add UITextView extension so you avoid redundant code and use all over the app.
extension UITextView {
    var numberOfLines: Int {
        // Get number of lines
        let numberOfGlyphs = self.layoutManager.numberOfGlyphs
        var index = 0, numberOfLines = 0
        var lineRange = NSRange(location: NSNotFound, length: 0)

        while index < numberOfGlyphs {
            self.layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &lineRange)
          index = NSMaxRange(lineRange)
          numberOfLines += 1
        }

        return numberOfLines
    }
}


extension JobDetailController:CustomCellDelegate{
    func cellTextDidChanges(indexPath: IndexPath, text: String) {
        strs[indexPath.section*12 + indexPath.row] = text
    }
}


