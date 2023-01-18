// 
// BaseCollectionViewCell.swift
// 
// Created by bongzniak on 2022/06/07.
//

import Foundation

import UIKit
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {


    var disposeBag = DisposeBag()

    // MARK: Initializing

    override init(frame: CGRect) {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        self.addViews()
        self.setupViews()
        self.setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        logger.verbose("DEINIT: \(String(describing: type(of: self)))")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()
    }

    // MARK: UI Setup

    func addViews() {
    }

    func setupViews() {
    }

    func setupConstraints() {
    }
}
