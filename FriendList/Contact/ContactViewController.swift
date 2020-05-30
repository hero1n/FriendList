//
//  ViewController.swift
//  FriendList
//
//  Created by jaewon on 2020/05/28.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class ContactViewController: BaseController {
    
    fileprivate let viewModel = ContactViewModel()
    
    lazy var searchBar = UISearchBar()
    lazy var tableView = UITableView()
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
        self.setup()
    }
    
    func configureUI() {
        self.view.addSubview(self.searchBar)
        self.searchBar.placeholder = "Search"
        self.searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_topMargin)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchBar.snp_bottomMargin).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func setup() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(ContactUserCell.self)
        
        self.searchBar.rx.text
            .orEmpty
            .debounce(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.count > 1 }
            .subscribe({ (query) in
                print(debug: query)
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        self.viewModel
            .observeItems()
            .subscribe({ (event) in
                guard let items = event.element else { return }
                
                print(debug: "test \(items.count)")
                self.tableView.reloadData()
            })
            .disposed(by: self.disposeBag)
    }
}

extension ContactViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.value[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(debug: "\(self.viewModel.items.value[indexPath.section].rowCount) \(self.viewModel.items.value.count)")
        let item = self.viewModel.items.value[indexPath.section]
        
        switch item.type {
        case .user:
            if let cell = tableView.dequeue(ContactUserCell.self),
                let item = item as? ContactViewModelUserItem {
                cell.user = item.users[indexPath.row]
                print(debug: "test 1")
                return cell
            }
        }
        
        return UITableViewCell()
    }
}

extension ContactViewController: UITableViewDelegate {
    
}
