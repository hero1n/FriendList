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
    
    lazy var tagLabel = UILabel().then {
        $0.layer.cornerRadius = $0.frame.size.height / 2
        $0.backgroundColor = UIColor.systemGray
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    var tagText: String? {
        didSet {
            self.tagLabel.text = tagText
        }
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
    
    private func configureUI() {
        self.addSubview(self.tagLabel)
        self.backgroundColor = .white
        
        self.tagLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}
