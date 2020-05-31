//
//  UserManager.swift
//  FriendList
//
//  Created by jaewon on 2020/05/31.
//  Copyright © 2020 jaewon. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import Then

class UserManager {
    static let shared: UserManager = UserManager()
    
    var users: [User] = [] {
        didSet {
            self.syncronize()
        }
    }
    
    init() {
        if let userDicts = Defaults[\.users] {
            self.users = userDicts.map {
                User.from(dictionary: $0)
            }
        } else {
            Defaults[\.users] = [User().then {
                $0.name = "Test"
                $0.phone = "010-1234-5678"
                $0.email = "example@test.com"
                $0.tags = ["a", "bb", "ccc"]
                }.toDictionary()]
        }
    }
    
    func syncronize() {
        Defaults[\.users] = self.users.map {
            $0.toDictionary()
        }
    }
}
