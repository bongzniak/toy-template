//
//  SplashViewReactor.swift
//  appname
//
//  Created by bongzniak on 2023/01/18.
//  Copyright © 2023 tmsae. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

final class SplashViewReactor: Reactor {
  
    enum Action {
    }

    enum Mutation {
    }

    struct State {
    }

    let initialState: State

    // MARK: Initializing
    
    init() {
        initialState = State()
    }

    // MARK: Mutate

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        }
    }

    // MARK: Reduce

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
        }

        return state
    }
}
