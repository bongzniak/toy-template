// 
// UIImage+Extesion.swift
// tmsae
// 
// Created by bongzniak on 2022/06/12.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(color: UIColor) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = colorImage?.cgImage else {
            return nil
        }

        self.init(cgImage: cgImage)
    }

    func resize(
        maxWidth: CGFloat = 500,
        maxHeight: CGFloat = 500
    ) -> UIImage {
        var image: UIImage = self
        let ratio = size.height / size.width

        if size.width > maxWidth || size.height > maxHeight {
            image = size.width >= size.height
                ? resize(CGSize(width: maxWidth, height: maxWidth * ratio))
                : resize(CGSize(width: maxHeight / ratio, height: maxHeight))
        }

        return image
    }

    fileprivate func resize(_ size: CGSize) -> UIImage {
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}
