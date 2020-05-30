//
//  UITableView.swift
//  FriendList
//
//  Created by jaewon on 2020/05/29.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit

extension UITableView {
    public func register<T: UITableViewCell>(_ cellClass: T.Type) {
        self.register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    public func dequeue<T: UITableViewCell>(_ cellClass: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cellClass.identifier) as? T
    }

    public func dequeue<T: UITableViewCell>(_ cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as? T
    }
}
