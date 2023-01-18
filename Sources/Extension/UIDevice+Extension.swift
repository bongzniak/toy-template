// 
// UIDevice+Extension.swift
// dano
// 
// Created by bongzniak on 2022/06/28.
// Copyright 2022 dano. All rights reserved.
//

import UIKit

public extension UIDevice {

    var identifier: String {
        #if targetEnvironment(simulator)
            let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            let identifier = machineMirror.children.reduce("") { identifier, element in
                guard let value = element.value as? Int8, value != 0 else { return identifier }
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
        #endif
        return identifier
    }
}