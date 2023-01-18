//
//  UIFont+Extension.swift
//  planus
//
//  Created by bongzniak on 2022/06/02.
//  Copyright © 2022 tmsae. All rights reserved.
//

import UIKit

extension UIFont {
    static func regular(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "Pretendard-Regular", size: size)!
    }

    static func medium(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "Pretendard-Medium", size: size)!
    }
    
    static func bold(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "Pretendard-Bold", size: size)!
    }
}
