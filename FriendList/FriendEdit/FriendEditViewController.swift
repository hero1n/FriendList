//
//  FriendEditViewController.swift
//  FriendList
//
//  Created by jaewon on 2020/05/31.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import Then
import TagCellLayout

class FriendEditViewController: BaseController {
    
    lazy var profileImageButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentVerticalAlignment = .fill
        $0.contentHorizontalAlignment = .fill
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.clipsToBounds = true
        $0.setImage(UIImage(systemName: "flag"), for: .normal)
    }
    
    lazy var nameTextField = UnderlineTextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.lineColor = .lightGray
        $0.selectedLineColor = .black
        $0.placeholder = "이름"
    }
    
    lazy var phoneTextField = UnderlineTextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.lineColor = .lightGray
        $0.selectedLineColor = .black
        $0.keyboardType = .phonePad
        $0.placeholder = "핸드폰 번호"
    }
    
    lazy var emailTextField = UnderlineTextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.lineColor = .lightGray
        $0.selectedLineColor = .black
        $0.keyboardType = .emailAddress
        $0.placeholder = "이메일"
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
    
    lazy var tagCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.tagCellLayout).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .white
        $0.register(FriendEditTagCell.self)
        $0.register(FriendEditTagAddCell.self)
    }
    
    lazy var tagCellLayout = TagCellLayout(alignment: .left, delegate: self)
    
    let oneLineHeight: CGFloat = 20.0
    let tagFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    var user: User? {
        didSet {
            guard let user = self.user else { return }
            self.nameTextField.text = user.name
            self.phoneTextField.text = user.phone
            self.emailTextField.text = user.email
            self.tags = user.tags ?? []
        }
    }
    
    var tags: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
    }
    
    func configureUI() {
        self.view.addSubview(self.profileImageButton)
        self.view.addSubview(self.nameTextField)
        self.view.addSubview(self.phoneTextField)
        self.view.addSubview(self.emailTextField)
        self.view.addSubview(self.countryLabel)
        self.view.addSubview(self.tagLabel)
        self.view.addSubview(self.tagCollectionView)
        
        self.profileImageButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.snp_topMargin).offset(80)
            make.width.height.equalTo(60)
        }
        
        self.nameTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.top.equalTo(self.profileImageButton.snp_bottomMargin).offset(50)
        }
        
        self.phoneTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.top.equalTo(self.nameTextField.snp_bottomMargin).offset(30)
        }
        
        self.emailTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.top.equalTo(self.phoneTextField.snp_bottomMargin).offset(30)
        }
        
        self.countryLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(self.emailTextField.snp_bottomMargin).offset(50)
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
}

extension FriendEditViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeue(FriendEditTagCell.self, forIndexPath: indexPath) {
            cell.setTag(self.tags[indexPath.row], withFont: self.tagFont)
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension FriendEditViewController: UICollectionViewDelegate {
    
}

extension FriendEditViewController: TagCellLayoutDelegate {
    func tagCellLayoutTagSize(layout: TagCellLayout, atIndex index: Int) -> CGSize {
        let width = self.tags[index].width(withConstrainedHeight: self.oneLineHeight, font: self.tagFont) + 46
        return CGSize(width: width, height: self.oneLineHeight + 10)
    }
}
