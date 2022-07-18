//
//  MyHeadView.swift
//  EarnMoney
//
//  Created by ByteDance on 2022/5/15.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa
import SnapKit

class MyHeadView: UIView {
    
    private lazy var imageView = UIImageView(image: UIImage(named: "user")!)//R.image.user()

    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - 搭建界面
    private func setupUI() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(snp.centerY)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(66)
        }
        imageView.layer.cornerRadius = 33
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        
        addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.centerY).offset(16)
            make.centerX.equalToSuperview()
        }
    }

}

/// 由于我这次使用的Rx,所以是通过这种绑定方式进行,我想正是这种需要自己手写的绑定,所以才限制了iOS中MVVM的困难吧
//extension Reactive where Base: MyView {
//    var myInfo: Binder<CoinRank?> {
//        return Binder(base) { myView, model in
//            myView.myCoin = model
//        }
//    }
//}
