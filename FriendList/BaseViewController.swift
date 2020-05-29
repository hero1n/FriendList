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
     
    }
}
