// 
// UIScrollView+Extension.swift
// tmsae
// 
// Created by bongzniak on 2022/06/08.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit

extension UIScrollView {
    var isOverflowVertical: Bool {
        contentSize.height > frame.height && frame.height > 0
    }

    func isReachedTop(withTolerance tolerance: CGFloat = 0) -> Bool {
        guard isOverflowVertical else { return false }
        return contentOffset.y <= tolerance
    }

    func isReachedBottom(withTolerance tolerance: CGFloat = 0) -> Bool {
        guard isOverflowVertical else { return false }
        let contentOffsetBottom = contentOffset.y + frame.height
        return contentOffsetBottom > contentSize.height - tolerance
    }
}