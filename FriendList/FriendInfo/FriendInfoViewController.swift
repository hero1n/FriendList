//
//  FriendInfoViewController.swift
//  FriendList
//
//  Created by jaewon on 2020/05/30.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import SnapKit

class FriendInfoViewController: BaseController {
    
    lazy var profileImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.clipsToBounds = true
        $0.image = UIImage(systemName: "flag")
    }
    
    lazy var nameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Name"
    }
    
    lazy var phoneLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.text = "010-1234-5678"
    }
    
    lazy var mailLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.text = "email@email.com"
    }
    
    lazy var countryLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.text = "국가"
    }
    
    lazy var tagLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.text = "태그"
    }
    
    lazy var phoneButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "phone"), for: .normal)
    }
    
    lazy var mailButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "envelope"), for: .normal)
    }
    
    lazy var phoneStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 16
    }
    
    lazy var mailStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 16
    }
    
    lazy var countryStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 16
    }
    
    lazy var tagStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 16
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
    }
    
    func configureUI() {
        self.view.addSubview(self.profileImageView)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.phoneStackView)
        self.view.addSubview(self.mailStackView)
        self.view.addSubview(self.countryLabel)
        self.view.addSubview(self.countryStackView)
        self.view.addSubview(self.tagLabel)
        self.view.addSubview(self.tagStackView)
        
        self.phoneStackView.addArrangedSubview(self.phoneLabel)
        self.phoneStackView.addArrangedSubview(self.phoneButton)
        self.mailStackView.addArrangedSubview(self.mailLabel)
        self.mailStackView.addArrangedSubview(self.mailButton)
        
        self.profileImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.snp_topMargin).offset(80)
            make.width.height.equalTo(60)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.profileImageView.snp_bottomMargin).offset(16)
        }

        self.phoneStackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(self.nameLabel.snp_bottomMargin).offset(50)
        }

        self.mailStackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(self.phoneStackView.snp_bottomMargin).offset(20)
        }

        self.countryLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(self.mailStackView.snp_bottomMargin).offset(50)
        }

        self.countryStackView.snp.makeConstraints { (make) in
            make.left.equalTo(self.countryLabel.snp_rightMargin).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(self.countryLabel)
        }

        self.tagLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(self.countryLabel.snp_bottomMargin).offset(40)
        }

        self.tagStackView.snp.makeConstraints { (make) in
            make.left.equalTo(self.tagLabel.snp_rightMargin).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(self.tagLabel.snp_topMargin)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}
