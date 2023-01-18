// 
// BaseLabel.swift
// tmsae
// 
// Created by bongzniak on 2022/06/14.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func drawText(in rect: CGRect) {
        // offset by font
        // Logic of vertical center align in sketch is
        // capHeight to be the vertical center of the label.
        // Graphical explanation
        // |---|-------------|-----------|
        // |-----------------|             : ascender
        //                   |-----------| : descender
        //     |-------------|             : capHeight
        let topCapPad = font.ascender - font.capHeight
        let bottomCapPad = -font.descender
        let fontOffset = (bottomCapPad - topCapPad) / 2

        let offsetY = fontOffset
        super.drawText(in: rect.offsetBy(dx: 0, dy: offsetY))
    }
}