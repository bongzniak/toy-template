// 
// UIColor+Extension.swift
// tmsae
// 
// Created by bongzniak on 2022/06/07.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit

typealias PLColor = UIColor

extension PLColor {
    // MARK:  Overlay
    /// #000000, 0.2
    static var overlay1: PLColor {
        UIColor(assetNamed: "overlay1")
    }
    /// #000000, 0.5
    static var overlay2: PLColor {
        UIColor(assetNamed: "overlay2")
    }
    /// #000000, 0.8
    static var overlay3: PLColor {
        UIColor(assetNamed: "overlay3")
    }

    // MARK:  Theme basic
    static var white: PLColor {
        UIColor(assetNamed: "white")
    }
    static var black: PLColor {
        UIColor(assetNamed: "black")
    }

    // MARK:  Theme grey
    /// #FBFBFD
    static var grey1: PLColor {
        UIColor(assetNamed: "grey1")
    }
    /// #F7F7F9
    static var grey2: PLColor {
        UIColor(assetNamed: "grey2")
    }
    /// #EBEBF1
    static var grey3: PLColor {
        UIColor(assetNamed: "grey3")
    }
    /// #D5D5DE
    static var grey4: PLColor {
        UIColor(assetNamed: "grey4")
    }
    /// #BAB9C6
    static var grey5: PLColor {
        UIColor(assetNamed: "grey5")
    }
    /// #A4A3AE
    static var grey6: PLColor {
        UIColor(assetNamed: "grey6")
    }
    /// #72717D
    static var grey7: PLColor {
        UIColor(assetNamed: "grey7")
    }
    /// #5E5D69
    static var grey8: PLColor {
        UIColor(assetNamed: "grey8")
    }
    /// #3F3E49
    static var grey9: PLColor {
        UIColor(assetNamed: "grey9")
    }
    /// #121214
    static var grey10: PLColor {
        UIColor(assetNamed: "grey10")
    }

    // MARK:  Theme blue
    /// #F3F4FE
    static var blue1: PLColor {
        UIColor(assetNamed: "blue1")
    }
    /// #E6E3FC
    static var blue2: PLColor {
        UIColor(assetNamed: "blue2")
    }
    /// #D1CBFF
    static var blue3: PLColor {
        UIColor(assetNamed: "blue3")
    }
    /// #9A9FF7
    static var blue4: PLColor {
        UIColor(assetNamed: "blue4")
    }
    /// #5E66FF
    static var blue5: PLColor {
        UIColor(assetNamed: "blue5")
    }
    /// #3640F0
    static var blue6: PLColor {
        UIColor(assetNamed: "blue6")
    }
    /// #000CD9
    static var blue7: PLColor {
        UIColor(assetNamed: "blue7")
    }
    /// #0A13B0
    static var blue8: PLColor {
        UIColor(assetNamed: "blue7")
    }
}

extension UIColor {
    convenience init(assetNamed: String) {
        guard let _ = UIColor(named: assetNamed)
        else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }

        self.init(named: assetNamed)!
    }

    convenience init(hex: String, alpha: CGFloat = 1.0) {
        if hex.hasPrefix("#") {
            var hexColor = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexColor = hexColor.replacingOccurrences(of: "#", with: "")

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var rgbValue: UInt64 = 0
                scanner.scanHexInt64(&rgbValue)
                let r: CGFloat = CGFloat((rgbValue & 0xff0000) >> 16) / 255
                let g: CGFloat = CGFloat((rgbValue & 0xff00) >> 8) / 255
                let b: CGFloat = CGFloat(rgbValue & 0xff) / 255

                self.init(red: r, green: g, blue: b, alpha: alpha)
                return
            }
        }
        self.init(red: 0, green: 0, blue: 0, alpha: alpha)
    }
}
