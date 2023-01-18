//
//  UserDefaultsWrapper.swift
//  appname
//
//  Created by bongzniak on 2023/01/18.
//  Copyright © 2023 tmsae. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultsWrapper<Value> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard
    
    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        
        set {
            container.setValue(newValue, forKey: key)
        }
    }
}

