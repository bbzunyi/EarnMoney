//
//  MoreTableViewCell.swift
//  EarnMoney
//
//  Created by bb on 2022/5/14.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }

    func setupView() {
        addSubview(cellView)
        cellView.addSubview(dayLabel)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
          let view = UIView()
        view.backgroundColor = UIColor(red: CGFloat(135.0/255), green: CGFloat(206.0/255), blue: CGFloat(235.0/255), alpha: 1)
          view.layer.cornerRadius = 30
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
      
      let dayLabel: UILabel = {
          let label = UILabel()
          label.text = "兼职信息"
          label.textColor = UIColor.white
          label.font = UIFont.boldSystemFont(ofSize: 25)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
}

extension UITableViewCell {
  func separator(hide: Bool) {
    separatorInset.left = hide ? UIScreen.main.bounds.width : 0
  }
}
