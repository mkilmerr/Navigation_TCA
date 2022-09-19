//
//  FirstState+Reducer.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import ComposableArchitecture

extension FirstState {
    static let reducerCore = Reducer<FirstState, FirstAction, Void> { state, action, _ in
        switch action {
            case let .setNavigation(selection: .some(navigatedId)):
                state.second = Identified(SecondState(), id: navigatedId)
            case .setNavigation(selection: .none):
                state.second = nil
            default:
                ()
        }
        return .none
    }
}

extension FirstState {
    static let firstReducer =  Reducer<FirstState, FirstAction, Void>
        .combine(
            reducerCore,
            SecondState.reducer
                .optional()
                .pullback(state: \Identified.value, action: .self, environment: { $0 })
                .optional()
                .pullback(
                    state: \FirstState.second,
                    action: /FirstAction.second,
                    environment: { $0 })
        )
}
