//
//  AppState+Reducer.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import ComposableArchitecture

extension AppState {
    static let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
        Reducer { state, action, env in
            switch action {
                case .plus:
                    state.amount += 1
                    return .none
                case .minus:
                    if state.amount != 0 { state.amount -= 1}
                    return .none
                case let .setNavigation(selection: .some(navigatedId)):
                    state.first = Identified(FirstState(), id: navigatedId)
                case .setNavigation(selection: .none):
                    state.first = nil
                default:
                    ()
            }
            return .none
        },
        FirstState
            .firstReducer
            .optional()
            .pullback(state: \Identified.value, action: .self, environment: { $0 })
            .optional()
            .pullback(
                state: \AppState.first,
                action: /AppAction.first,
                environment: { $0 }
            )
    )
}
