//
//  ContactViewModel.swift
//  FriendList
//
//  Created by jaewon on 2020/05/29.
//  Copyright © 2020 jaewon. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

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
    
    var users: [User] = []
    
    init() {
        users.append(User())
    }
    
    init(_ users: [User]) {
        self.users = users
    }
}

class ContactViewModel: NSObject {
    var items: BehaviorRelay<[ContactViewModelItem]> = BehaviorRelay(value: [])
    
    override init() {
        super.init()
        
        self.items.accept([ContactViewModelUserItem(UserManager.shared.users)])
    }
    
    public func observeItems() -> Observable<[ContactViewModelItem]> {
        return self.items.asObservable().observeOn(MainScheduler())
    }
}
