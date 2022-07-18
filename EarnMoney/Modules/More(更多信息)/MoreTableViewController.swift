//
//  MoreTableViewController.swift
//  EarnMoney
//
//  Created by bb on 2022/5/14.
//

import UIKit
import Foundation

class MoreTableViewController: UITableViewController{
    let tableview: UITableView = {
            let tv = UITableView()
            tv.backgroundColor = UIColor.white
            tv.translatesAutoresizingMaskIntoConstraints = false
            tv.separatorColor = UIColor.white
            return tv
        }()
    
    var jobs:[JobDetail] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        self.loadItem()
        setupTableView()
    }

    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(MoreTableViewCell.self, forCellReuseIdentifier: "morecell")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableview.dequeueReusableCell(withIdentifier: "morecell") as! MoreTableViewCell
        cell.backgroundColor = UIColor.white
        if indexPath.row == 0{
            cell.dayLabel.text = "兼职信息"
            cell.cellView.backgroundColor = UIColor(red: CGFloat(65.0/255), green: CGFloat(105.0/255), blue: CGFloat(225.0/255), alpha: 1)
        }else if indexPath.row == 1{
            cell.dayLabel.text = "同城趣事"
            cell.cellView.backgroundColor = UIColor(red: CGFloat(65.0/255), green: CGFloat(105.0/255), blue: CGFloat(225.0/255), alpha: 0.9)
        }else if indexPath.row == 2{
            cell.dayLabel.text = "交易平台"
            cell.cellView.backgroundColor = UIColor(red: CGFloat(65.0/255), green: CGFloat(105.0/255), blue: CGFloat(225.0/255), alpha: 0.8)
        }
        cell.separator(hide: true)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let PartVC = storyboard.instantiateViewController(withIdentifier: "PartJobWindow") as? PartTimeJobController else {  return }
            PartVC.savejobdelegate = self
            PartVC.jobs = jobs
            PartVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(PartVC, animated: true)
        }
        
    }
    
}

extension MoreTableViewController:SaveJobsDelegate{
    func savejobs(jobs: [JobDetail]) {
        self.jobs = jobs
    }
}

extension MoreTableViewController{
    func dataFilePath()->URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return path!.appendingPathComponent("parttimejob.json")
    }
    
    func saveAllItems(){
        do{
            var encode_strs:[[String]] = []
            for job in jobs{
                encode_strs.append(job.encode())
            }
            let data = try JSONEncoder().encode(encode_strs)
            try data.write(to: dataFilePath(),options: .atomic)
        }catch{
            print("Can not save: \(error.localizedDescription)")
        }
    }
    
    func loadItem(){
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path){
            do{
                let decode_strs:[[String]] = try JSONDecoder().decode([[String]].self, from: data)
                for strs in decode_strs{
                    jobs.append(JobDetail(jobname: strs[0], jobtype: strs[1], firm_name: strs[2], require_num: strs[3], salary: strs[4], start_time: strs[5], end_time: strs[6], work_position: strs[7], work_description: strs[8], work_requirement: strs[9], work_necessary_description: strs[10], work_peomeasure: strs[11], contactor: strs[12], phone_number: strs[13], address: strs[14]))
                }
            } catch{
                print("Error decoding list:\(error.localizedDescription)")
            }
        }
    }
}
