//
//  SplashViewController.swift
//  appname
//
//  Created by bongzniak on 2023/01/18.
//  Copyright © 2023 tmsae. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

final class SplashViewController: BaseViewController, ReactorKit.View {
    
    typealias Reactor = SplashViewReactor
    
    private enum Metric {
        
    }
    
    private enum Color {
        
    }
    
    private enum Font {
        
    }
    
    private enum Localized {
        
    }
    
    // MARK: Properties

    private let presentLoginScreen: () -> Void
    private let presentMainScreen: () -> Void
    
    // MARK: UI
    
    let bodyView: SplashView
    
    // MARK: Initializing
    
    init(
        reactor: Reactor,
        bodyView: SplashView,
        presentLoginScreen: @escaping () -> Void,
        presentMainScreen: @escaping () -> Void
    ) {
        defer {
            self.reactor = reactor
        }
        
        self.bodyView = bodyView
        
        self.presentLoginScreen = presentLoginScreen
        self.presentMainScreen = presentMainScreen
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Life Cycle
    
    override func loadView() {
        super.loadView()

        view = bodyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Binding
    
    func bind(reactor: Reactor) {

        // Action
        
    }
}

extension SplashViewController {
    class func instance(
        presentLoginScreen: @escaping () -> Void,
        presentMainScreen: @escaping () -> Void
    ) -> SplashViewController {
        SplashViewController(
            reactor: SplashViewReactor(),
            bodyView: SplashView.instance(),
            presentLoginScreen: presentLoginScreen,
            presentMainScreen: presentMainScreen
        )
    }
}
