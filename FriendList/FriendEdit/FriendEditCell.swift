//
//  FriendEditCell.swift
//  FriendList
//
//  Created by jaewon on 2020/05/31.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import Then
import SnapKit

class FriendEditTagCell: UICollectionViewCell {
    
    lazy var containerView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var backgroundColorView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lightGray
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    lazy var containerStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
    }
    
    lazy var tagLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    lazy var tagDeleteButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
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
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.backgroundColorView)
        self.containerView.addSubview(self.containerStackView)
        self.containerStackView.addArrangedSubview(self.tagLabel)
        self.containerStackView.addArrangedSubview(self.tagDeleteButton)
        self.backgroundColor = .white
        
        self.containerView.snp.makeConstraints { (make) in
            make.margins.equalToSuperview()
        }
        
        self.backgroundColorView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
        }
        
        self.containerStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-6)
        }
    }
}
