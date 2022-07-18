//
//  PartTimeJobCell.swift
//  EarnMoney
//
//  Created by bb on 2022/5/15.
//

import UIKit

class PartTimeJobCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }

    func setupView() {
        addSubview(cellView)
        cellView.addSubview(JobNameLabel)
        cellView.addSubview(Label1)
        cellView.addSubview(Label2)
        cellView.addSubview(Label3)
        cellView.addSubview(Label4)
        cellView.addSubview(Label5)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        JobNameLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        JobNameLabel.widthAnchor.constraint(equalToConstant: 600).isActive = true
        //JobNameLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        JobNameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        JobNameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: -80).isActive = true
        
        Label1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        Label1.widthAnchor.constraint(equalToConstant: 600).isActive = true
        Label1.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        Label1.topAnchor.constraint(equalTo: JobNameLabel.topAnchor, constant: 25).isActive = true
        
        Label2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        Label2.widthAnchor.constraint(equalToConstant: 600).isActive = true
        Label2.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        Label2.topAnchor.constraint(equalTo: Label1.topAnchor, constant: 40).isActive = true
        
        Label3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        Label3.widthAnchor.constraint(equalToConstant: 600).isActive = true
        Label3.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        Label3.topAnchor.constraint(equalTo: Label2.topAnchor, constant: 25).isActive = true
        
        Label4.heightAnchor.constraint(equalToConstant: 200).isActive = true
        Label4.widthAnchor.constraint(equalToConstant: 600).isActive = true
        Label4.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        Label4.topAnchor.constraint(equalTo: Label3.topAnchor, constant: 25).isActive = true
        
        Label5.heightAnchor.constraint(equalToConstant: 200).isActive = true
        Label5.widthAnchor.constraint(equalToConstant: 600).isActive = true
        Label5.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        Label5.topAnchor.constraint(equalTo: Label4.topAnchor, constant: 25).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
          let view = UIView()
          view.backgroundColor = UIColor(red: CGFloat(140.0/255), green: CGFloat(0.0/255), blue: CGFloat(211.0/255), alpha: 1)
          view.layer.cornerRadius = 30
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
      
      let JobNameLabel: UILabel = {
          let label = UILabel()
          label.text = "2021-2022历史学院学工办助理"
          label.textColor = UIColor.white
          label.font = UIFont.boldSystemFont(ofSize: 20)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    let Label1: UILabel = {
        let label = UILabel()
        label.text = "历史系（学工办）| 长期岗位| 9人已申请"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Label2: UILabel = {
        let label = UILabel()
        label.text = "薪资标准  22/小时"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Label3: UILabel = {
        let label = UILabel()
        label.text = "工作地点  历史学院教务办公室"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Label4: UILabel = {
        let label = UILabel()
        label.text = "工作时间  2021-09-24-2022-06-30"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Label5: UILabel = {
        let label = UILabel()
        label.text = "通过人数/需求人数  1/2"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}


