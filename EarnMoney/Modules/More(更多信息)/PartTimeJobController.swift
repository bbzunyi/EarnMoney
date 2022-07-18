//
//  PartTimeJobController.swift
//  EarnMoney
//
//  Created by bb on 2022/5/15.
//

import UIKit
import Foundation
protocol SaveJobsDelegate{
    func savejobs(jobs:[JobDetail])
}
class PartTimeJobController: UITableViewController {
    
    var jobs:[JobDetail] = []
    var savejobdelegate:SaveJobsDelegate?
    let tableview: UITableView = {
            let tv = UITableView()
            tv.backgroundColor = UIColor.white
            tv.translatesAutoresizingMaskIntoConstraints = false
            tv.separatorColor = UIColor.white
            return tv
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
//        searchbar.layer.borderWidth = 1
//        searchbar.layer.borderColor = UIColor.white.cgColor
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
       // searchbar.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 0)
        
        tableview.register(PartTimeJobCell.self, forCellReuseIdentifier: "PartCell")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    @IBAction func TouchPublish(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let JDVC = storyboard.instantiateViewController(withIdentifier: "JobDetailWindow") as? JobDetailController else {  return }
        JDVC.type = 1//0:check 1:publish
        JDVC.addjobdelegate = self
        JDVC.job_description = JobDetail()
        self.navigationController?.pushViewController(JDVC, animated: true)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return jobs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableview.dequeueReusableCell(withIdentifier: "PartCell") as! PartTimeJobCell
        cell.backgroundColor = UIColor.white
        //cell.Label1.text = "eyew"
        cell.separator(hide: true)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let JDVC = storyboard.instantiateViewController(withIdentifier: "JobDetailWindow") as? JobDetailController else {  return }
        JDVC.type = 0//0:check 1:publish
        JDVC.job_description = jobs[indexPath.row]
        self.navigationController?.pushViewController(JDVC, animated: true)
    
        
    }
    

}

extension PartTimeJobController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text,
           searchText.isEmpty == false  {
//            filteredSongs = songs.filter({ song in
//                song.localizedStandardContains(searchText)
//            })
        } else {
            //filteredSongs = songs
        }
        tableview.reloadData()
    }
}

extension UILabel {
    var numberOfVisibleLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let textHeight = sizeThatFits(maxSize).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
}

extension PartTimeJobController:addJobDetailDelegate{
    func addjob(job: JobDetail) {
        self.navigationController?.popViewController(animated: true)
        self.jobs.append(job)
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        self.savejobdelegate?.savejobs(jobs: self.jobs)
    }
}


