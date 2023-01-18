//
//  SplashView.swift
//  appname
//
//  Created by bongzniak on 2023/01/18.
//  Copyright © 2023 tmsae. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift
import RxDataSources
import ReusableKit
import SnapKit
import Then

final class SplashView: BaseView {
    
    private enum Metric {
    }
    
    private enum Color {   
    }
    
    private enum Font {    
    }
    
    private enum Localized {
    }
    
    // MARK: Properties
    
    // MARK: Initializing
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    override func addViews() {
        super.addViews()
    }
    
    override func setupViews() {
        super.setupViews()
    }

    override func setupConstraints() {
        super.setupConstraints()
    }
}

extension SplashView {
    class func instance() -> SplashView {
        SplashView()
    } 
}
