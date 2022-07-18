//
//  JobDetailCell.swift
//  EarnMoney
//
//  Created by bb on 2022/5/15.
//

import UIKit

class JobDetailCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
   
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(Label)
        contentView.addSubview(Label1)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.widthAnchor.constraint(equalToConstant: 150),
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 200),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0),
            //cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        ])

        Label.heightAnchor.constraint(equalToConstant: 200).isActive = true
        Label.widthAnchor.constraint(equalToConstant: 80).isActive = true
        Label.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        Label.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 40).isActive = true
        
        NSLayoutConstraint.activate([
                 Label1.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                 Label1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 170),
     //            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 200),
                 Label1.leftAnchor.constraint(equalTo: self.cellView.rightAnchor, constant: 10),
                
                 
                 Label1.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0),
             ])
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let view = UIView()//(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        view.backgroundColor = UIColor(red: CGFloat(221.0/255), green: CGFloat(160.0/255), blue: CGFloat(221.0/255), alpha: 0.5)
          //view.layer.cornerRadius = 30
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
      
      let Label: UILabel = {
          let label = UILabel()
          label.text = "兼职信息"
          label.textColor = UIColor.black
          label.font = UIFont.boldSystemFont(ofSize: 15)
          label.numberOfLines = 0
          label.lineBreakMode = .byWordWrapping
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    let Label1: UILabel = {
        let label = UILabel()
        label.text = "兼职信息"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
      
}

