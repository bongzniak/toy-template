// 
// Date+Extension.swift
// tmsae
// 
// Created by bongzniak on 2022/06/15.
// Copyright 2022 tmsae. All rights reserved.
//

import Foundation

extension Date {
    func toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale.current
        dateFormatter.isLenient = true
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.string(from: self)
    }
}