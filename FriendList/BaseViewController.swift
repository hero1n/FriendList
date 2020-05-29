//
//  BaseViewController.swift
//  FriendList
//
//  Created by jaewon on 2020/05/29.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit

typealias BaseController = BaseViewController & BaseProtocol

protocol BaseProtocol: UIViewController {
    func configureUI()
}

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureDefaultUI()
    }
    
    func configureDefaultUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
}
