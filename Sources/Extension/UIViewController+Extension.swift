// 
// UIViewController+Extension.swift
// tmsae
// 
// Created by bongzniak on 2022/06/08.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit

extension UIViewController {
    func navigationWrap() -> BaseNavigationController {
        BaseNavigationController(rootViewController: self)
    }
}