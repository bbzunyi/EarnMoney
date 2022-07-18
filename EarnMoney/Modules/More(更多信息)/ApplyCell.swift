//
//  ApplyCell.swift
//  EarnMoney
//
//  Created by bb on 2022/5/15.
//

import UIKit
protocol AlertShower{
    func showAlert(TableCell:ApplyCell)
}

class ApplyCell: UITableViewCell {
    var delegate: AlertShower?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(applyButton)
        setupView()
    }

    func setupView() {
        
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            applyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            applyButton.widthAnchor.constraint(equalToConstant: 100),
            applyButton.heightAnchor.constraint(equalToConstant: 40),
            applyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0)
        ])
        
     
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let applyButton:UIButton = {
        let button = UIButton()
        button.setTitle("申请", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.purple
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    @objc func buttonTapped( sender : UIButton) {
                    //Write button action here
        print("123")
        self.delegate?.showAlert(TableCell: self)
    }
    
      
}
