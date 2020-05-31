//
//  FriendInfoCell.swift
//  FriendList
//
//  Created by jaewon on 2020/05/31.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import Then
import SnapKit

class FriendInfoTagCell: UICollectionViewCell {
    
    lazy var containerView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    lazy var tagLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .lightGray
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 14)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.configureUI()
    }
    
    public func setTag(_ text: String, withFont font: UIFont = UIFont.systemFont(ofSize: 14)) {
        self.tagLabel.text = text
        self.tagLabel.font = font
    }
    
    private func configureUI() {
        self.containerView.addSubview(self.tagLabel)
        self.addSubview(self.containerView)
        self.backgroundColor = .white
        
        self.containerView.snp.makeConstraints { (make) in
            make.margins.equalToSuperview()
        }
        
        self.tagLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }
}
