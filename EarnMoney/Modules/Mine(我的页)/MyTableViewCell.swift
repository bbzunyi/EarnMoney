//
//  MyTableViewCell.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/16.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
//    @IBOutlet weak var title: UILabel!
    
    var title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 20.0)
        title.textColor = .blue
        contentView.addSubview(title)
        
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
