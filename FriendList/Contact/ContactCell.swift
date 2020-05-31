//
//  ContactCell.swift
//  FriendList
//
//  Created by jaewon on 2020/05/29.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import SnapKit
import Then

protocol ContactCell {
    var item: ContactViewModelItem? { get }
    var viewModel: ContactViewModel? { get }
    
    func configureUI()
}

extension ContactCell {
    var item: ContactViewModelItem? {
        return nil
    }
    
    var viewModel: ContactViewModel? {
        return nil
    }
}

class ContactUserCell: UITableViewCell, ContactCell {
    
    lazy var titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 14.0)
    }
    
    lazy var descriptionLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .systemGray
        $0.font = UIFont.systemFont(ofSize: 12.0)
    }
    
    lazy var profileImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.clipsToBounds = true
    }
    
    lazy var phoneButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "phone"), for: .normal)
    }
    
    lazy var mailButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "envelope"), for: .normal)
    }
    
    lazy var labelStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fillProportionally
        $0.axis = .vertical
    }
    
    lazy var buttonStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fillProportionally
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    var user: User? {
        didSet {
            guard let user = self.user else { return }
            
            print(debug: "test 2")
            
            self.titleLabel.text = "Test"
            self.descriptionLabel.text = "TestTEstTest"
            self.profileImageView.image = UIImage(systemName: "flag")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.configureUI()
    }
    
    func configureUI() {
        self.labelStackView.addArrangedSubview(self.titleLabel)
        self.labelStackView.addArrangedSubview(self.descriptionLabel)
        self.buttonStackView.addArrangedSubview(self.phoneButton)
        self.buttonStackView.addArrangedSubview(self.mailButton)
        
        self.contentView.addSubview(self.profileImageView)
        self.contentView.addSubview(self.labelStackView)
        self.contentView.addSubview(self.buttonStackView)
        
        self.labelStackView.snp.contentHuggingHorizontalPriority = 1000
        self.buttonStackView.snp.contentHuggingHorizontalPriority = 999
        
        self.profileImageView.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.top.equalTo(self.contentView.snp_topMargin)
            make.bottom.equalTo(self.contentView.snp_bottomMargin)
            make.width.height.lessThanOrEqualTo(30)
        }
        
        self.labelStackView.snp.makeConstraints { (make) in
            make.left.equalTo(self.profileImageView.snp_rightMargin).offset(16)
            make.right.equalTo(self.buttonStackView.snp_leftMargin).offset(-8)
            make.top.equalTo(self.contentView.snp_topMargin).offset(-4)
            make.bottom.equalTo(self.contentView.snp_bottomMargin).offset(4)
        }
        
        self.buttonStackView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.top.equalTo(self.contentView.snp_topMargin).offset(4)
            make.bottom.equalTo(self.contentView.snp_bottomMargin).offset(-4)
        }
        
        self.phoneButton.snp.makeConstraints { (make) in
            make.width.height.lessThanOrEqualTo(20)
        }
        
        self.mailButton.snp.makeConstraints { (make) in
            make.width.height.lessThanOrEqualTo(20)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
