// 
// UILabel+Extension.swift
// tmsae
// 
// Created by bongzniak on 2022/06/08.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit

extension UILabel {
    func highlight(searchText: String, color: UIColor = .yellow) {
        guard let labelText = self.text else { return }
        do {
            let mutableString = NSMutableAttributedString(string: labelText)
            let regex = try NSRegularExpression(pattern: searchText, options: .caseInsensitive)

            for match in regex.matches(in: labelText, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: labelText.utf16.count)) as [NSTextCheckingResult] {
                mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: match.range)
            }
            self.attributedText = mutableString
        } catch {
            print(error)
        }
    }
}