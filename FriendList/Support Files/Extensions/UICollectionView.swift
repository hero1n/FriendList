//
//  UICollectionView.swift
//  FriendList
//
//  Created by jaewon on 2020/05/31.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        self.register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
    }

    public func dequeue<T: UICollectionViewCell>(_ cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: cellClass.identifier, for: indexPath) as? T
    }

}
