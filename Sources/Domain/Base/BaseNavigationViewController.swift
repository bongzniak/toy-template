//
//  BaseNavigationController.swift
//
//  Created by Fernando on 2020/01/05.
//  Copyright © 2020 tmsae. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    // MARK: Properties
    
    // MARK: Initialize
    
    // MARK: Life Cycle
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        self.navigationBar.prefersLargeTitles = false
    }
    
    deinit {
        logger.verbose("DEINIT: \(String(describing: type(of: self)))")
    }
    
    // MARK: - Layout Constraints
    
    // MARK: - Configure
}
