//
//  TallyTableViewCell.swift
//  EarnMoney
//
//  Created by bb on 2022/2/9.
//

import UIKit

class TallyTableViewCell: UITableViewCell {

//    @IBOutlet weak var TallyImage: UIImageView!
//    @IBOutlet weak var remark: UILabel!
//    @IBOutlet weak var money: UILabel!
    
    var remark = UILabel()
    var TallyImage = UIImageView(frame:CGRect(x: 0, y: 0, width: 60, height: 60))
    var money = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        remark.translatesAutoresizingMaskIntoConstraints = false
        money.translatesAutoresizingMaskIntoConstraints = false
        //money.font = UIFont.systemFont(ofSize:.)
        TallyImage.translatesAutoresizingMaskIntoConstraints = false
        TallyImage.contentMode = .left
        contentView.addSubview(remark)
        contentView.addSubview(money)
        contentView.addSubview(TallyImage)
        //custom layout constraints
        remark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
        remark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0).isActive = true
        remark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80.0).isActive = true
        remark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true
        money.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
        money.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0).isActive = true
        money.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIScreen.main.bounds.width - 80).isActive = true
        money.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true
        TallyImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
        TallyImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0).isActive = true
        TallyImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0).isActive = true
        TallyImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true


        }
        required init(coder aDecoder: NSCoder) {
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
