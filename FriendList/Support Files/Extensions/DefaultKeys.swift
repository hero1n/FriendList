//
//  DefaultKeys.swift
//  FriendList
//
//  Created by jaewon on 2020/05/31.
//  Copyright © 2020 jaewon. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    var users: DefaultsKey<Array<Dictionary<String, Any>>?> { .init("users") }
}
