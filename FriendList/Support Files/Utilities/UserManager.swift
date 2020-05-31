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
    
    var users: [User] = []
    
    init() {
        if let userDicts = Defaults[\.users] {
            self.users = userDicts.map {
                User.from(dictionary: $0)
            }
        } else {
            Defaults[\.users] = []
        }
    }
}
