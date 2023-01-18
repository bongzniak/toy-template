//
//  UserSetting.swift
//  appname
//
//  Created by bongzniak on 2023/01/18.
//  Copyright © 2023 tmsae. All rights reserved.
//

import Foundation

final class UserSettings: NSObject {
    static let standardUserDefaults: UserDefaults = UserDefaults.standard
    
    @UserDefaultsWrapper(key: "uerID", defaultValue: .zero)
    var userID: Int
}
