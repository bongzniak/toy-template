// 
// UIView+Extension.swift
// tmsae
// 
// Created by bongzniak on 2022/06/07.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat, byRoundingCorners: UIRectCorner) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(rawValue: byRoundingCorners.rawValue)
    }

    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        ]
        gradientLayer.locations = [0.0, 4.0]
        gradientLayer.locations = [0.49, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(
            CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0)
        )
        gradientLayer.bounds = bounds.insetBy(dx: -0.5 * bounds.size.width, dy: -0.5 * bounds.size.height)
        gradientLayer.position = center

        layer.insertSublayer(gradientLayer, at: 0)
    }
}
