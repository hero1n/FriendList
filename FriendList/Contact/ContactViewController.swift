//
//  ViewController.swift
//  FriendList
//
//  Created by jaewon on 2020/05/28.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import SnapKit

class ContactViewController: BaseController {
    
    lazy var searchBar = UISearchBar()
    lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
        self.setup()
    }
    
    func configureUI() {
        
        self.view.addSubview(self.searchBar)
        self.searchBar.placeholder = "Search"
        self.searchBar.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.height.equalTo(44)
            make.top.equalTo(self.view.snp_topMargin)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.top.equalTo(self.searchBar.snp_bottomMargin)
            make.leading.equalTo(self.view.snp_leadingMargin)
            make.trailing.equalTo(self.view.snp_trailingMargin)
            make.bottom.equalTo(self.view.snp_bottomMargin)
        }
    }
    
    func setup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension ContactViewController: UITableViewDelegate {
    
}
