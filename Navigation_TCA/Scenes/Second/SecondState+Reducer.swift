//
//  SecondState+Reducer.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import Foundation
import ComposableArchitecture

extension SecondState {
    static let reducerCore = Reducer<SecondState, SecondAction, Void> { state, action, _ in
        switch action {
            case .navigateToThirdView:
                state.third = Identified(ThirdState(), id: state.id)
                return .none
        }
    }
}

extension SecondState {
    static let reducer = Reducer<SecondState, SecondAction, Void>
        .combine(
            reducerCore,
            ThirdState.reducer
                .optional()
                .pullback(state: \Identified.value, action: .self, environment: { $0 })
                .optional()
                .pullback(
                    state: \SecondState.third,
                    action: /SecondAction.third,
                    environment: {$0})
        )
}
