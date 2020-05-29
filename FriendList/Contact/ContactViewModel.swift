//
//  ContactViewModel.swift
//  FriendList
//
//  Created by jaewon on 2020/05/29.
//  Copyright © 2020 jaewon. All rights reserved.
//

import Foundation

enum ContactViewModelItemType {
    case user
}

protocol ContactViewModelItem {
    var type: ContactViewModelItemType { get }
    var rowCount: Int { get }
}

class ContactViewModelUserItem: ContactViewModelItem {
    var type: ContactViewModelItemType {
        return .user
    }
    
    var rowCount: Int {
        return self.users.count
    }
    
    var users: [ContactModel.User] = []
    
    init(_ users: [ContactModel.User]) {
        self.users = users
    }
}

class ContactViewModel: NSObject {
    var items = [ContactViewModelItem]()
    
    override init() {
        super.init()
    }
}
