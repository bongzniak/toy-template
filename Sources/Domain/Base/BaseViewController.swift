//
//  BaseViewController.swift
//
//  Created by Fernando on 27/09/2019.
//  Copyright © 2019 tmsae. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Then

class BaseViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    // MARK: Properties
    
    var safeAreaInsets: UIEdgeInsets {
        get {
            if #available(iOS 11.0, *) {
                guard let window = UIApplication.shared.windows.first else {
                    return self.view.safeAreaInsets
                }
                return window.safeAreaInsets
            } else {
                return .zero
            }
        }
    }
    
    // MARK: Initializing
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    deinit {
        logger.verbose("DEINIT: \(String(describing: type(of: self)))")
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        setupViews()
    }
    
    func addViews() {
        
    }

    func setupViews() {
        
    }
}
