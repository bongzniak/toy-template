// 
// BaseView.swift
// tmsae
// 
// Created by bongzniak on 2022/06/07.
// Copyright 2022 tmsae. All rights reserved.
//

import UIKit
import SnapKit
import ReusableKit
import RxSwift
import RxCocoa
import Then

class BaseView: UIView {
    
    var disposeBag = DisposeBag()

    // MARK: Properties

    // MARK: Initializing
    
    init() {
        super.init(frame: .zero)

        addViews()
        setupViews()
        setupConstraints()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }

    deinit {
        logger.verbose("DEINIT: \(String(describing: type(of: self)))")
    }

    func addViews() {
    }

    func setupViews() {
    }

    func setupConstraints() {
    }
}
