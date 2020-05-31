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

class FriendInfoTagCell: UITableViewCell {
    
    lazy var tagLabel = UILabel().then {
        $0.layer.cornerRadius = $0.frame.size.height / 2
        $0.backgroundColor = UIColor.systemGray6
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.configureUI()
    }
    
    private func configureUI() {
        self.contentView.addSubview(self.tagLabel)
        
        self.tagLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.top.bottom.left.right.equalToSuperview()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
