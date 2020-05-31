//
//  User.swift
//  FriendList
//
//  Created by jaewon on 2020/05/29.
//  Copyright © 2020 jaewon. All rights reserved.
//

import Foundation
import Then

class User: NSObject {
    var name: String?
    var phone: String?
    var email: String?
    var country: String?
    var tag: [String]?
    
    func toDictionary() -> Dictionary<String, Any?> {
        return ["name": self.name,
            "phone": self.phone,
            "email": self.email,
            "country": self.country,
            "tag": self.tag]
    }
    
    static func from(dictionary: Dictionary<String, Any?>) -> User {
        return User().then {
            $0.name = dictionary["name"] as? String
            $0.phone = dictionary["phone"] as? String
            $0.email = dictionary["email"] as? String
            $0.country = dictionary["country"] as? String
            $0.tag = dictionary["tag"] as? [String]
        }
    }
}
