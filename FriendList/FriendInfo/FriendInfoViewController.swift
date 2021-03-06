//
//  FriendInfoViewController.swift
//  FriendList
//
//  Created by jaewon on 2020/05/30.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import SnapKit
import TagCellLayout

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
    
    lazy var tagCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.tagCellLayout).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        $0.register(FriendInfoTagCell.self)
    }
    
    lazy var tagCellLayout = TagCellLayout(alignment: .left, delegate: self)
    
    let oneLineHeight: CGFloat = 20.0
    let tagFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
        self.setup()
    }
    
    func configureUI() {
        let editBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"),
                                                style: .plain,
                                                target: self,
                                                action: #selector(self.editInfo))
        self.navigationItem.rightBarButtonItem = editBarButtonItem
        
        self.view.addSubview(self.profileImageView)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.phoneStackView)
        self.view.addSubview(self.mailStackView)
        self.view.addSubview(self.countryLabel)
        self.view.addSubview(self.countryStackView)
        self.view.addSubview(self.tagLabel)
        self.view.addSubview(self.tagCollectionView)
        
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

        self.tagCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(self.tagLabel.snp_rightMargin).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(self.tagLabel.snp_topMargin).offset(-14)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    func setup() {
        guard let user = self.user else { return }
        self.nameLabel.text = user.name
        self.phoneLabel.text = user.phone
        self.mailLabel.text = user.email
        self.phoneStackView.isHidden = user.phone?.isEmpty == true
        self.mailStackView.isHidden = user.email?.isEmpty == true
        
        self.tagCollectionView.reloadData()
    }
    
    @objc func editInfo() {
        let friendEditViewController = FriendEditViewController()
        friendEditViewController.user = self.user
        
        self.navigationController?.pushViewController(friendEditViewController, animated: true)
    }
}

extension FriendInfoViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.user?.tags?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeue(FriendInfoTagCell.self, forIndexPath: indexPath),
            let tags = self.user?.tags {
            cell.setTag(tags[indexPath.row], withFont: self.tagFont)
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension FriendInfoViewController: UICollectionViewDelegate {
    
}

extension FriendInfoViewController: TagCellLayoutDelegate {
    func tagCellLayoutTagSize(layout: TagCellLayout, atIndex index: Int) -> CGSize {
        if let tags = self.user?.tags {
            let width = tags[index].width(withConstrainedHeight: self.oneLineHeight, font: self.tagFont) + 40
            return CGSize(width: width, height: self.oneLineHeight + 10)
        }
        
        return CGSize.zero
    }
}
