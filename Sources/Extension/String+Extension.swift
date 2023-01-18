// 
// String+Extension.swift
// tmsae
// 
// Created by bongzniak on 2022/06/07.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit

extension String {
    func toUTCDate(format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return Date()
        }
    }

    var localized: String {
        NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
    }

    func textSize(
        font: UIFont,
        width: CGFloat = .greatestFiniteMagnitude,
        height: CGFloat = .greatestFiniteMagnitude,
        numberOnLineLines: Int = 0
    ) -> CGSize {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height)).then {
            $0.numberOfLines = numberOnLineLines
            $0.font = font
            $0.text = self
            $0.sizeToFit()
        }
        return label.frame.size
    }

    func substring(range: NSRange) -> String {
        substring(from: range.lowerBound, to: range.upperBound)
    }

    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }
}