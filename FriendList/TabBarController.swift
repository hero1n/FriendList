//
//  TabBarController.swift
//  FriendList
//
//  Created by jaewon on 2020/05/29.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configure()
    }
    
    private func configure() {
        let contactViewController = ContactViewController()
        contactViewController.tabBarItem = UITabBarItem(title: "연락처", image: UIImage(systemName: "person.crop.circle"), tag: 1)

        let searchViewController  = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "국가검색", image: UIImage(systemName: "flag"), tag: 2)
        
        let tagViewController = TagViewController()
        tagViewController.tabBarItem = UITabBarItem(title: "태그", image: UIImage(systemName: "tag"), tag: 3)
        
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "gear"), tag: 4)

        let tabBarList = [contactViewController, searchViewController, tagViewController, settingViewController]
        self.viewControllers = tabBarList
    }
}
