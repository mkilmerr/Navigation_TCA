//
//  FirstView+State+Reducer.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/09/22.
//

import Foundation
import ComposableArchitecture

extension FirstView.State {
    static let reducerCore = Reducer<FirstView.State, FirstView.Action, Void> { state, action, _ in
        switch action {
            case .didDismissSecondView:
                state.secondViewState = nil
                return .none
            case .presentSecondView:
                state.secondViewState = SecondView.State()
                state.secondViewState?.amount = state.amount
                return .none
            case .plus:
                state.amount += 1
                return .none
            case .minus:
                if state.amount != 0 { state.amount -= 1}
                return .none
            case .secondView(.navigateBackToFirstView):
                return .init(value: .didDismissSecondView)
        }
    }
}

extension FirstView.State {
    static let reducer = Reducer<FirstView.State, FirstView.Action, Void>
        .combine(
            reducerCore,
            SecondView.State.reducer
                .optional()
                .pullback(
                    state: \.secondViewState,
                    action: /FirstView.Action.secondView,
                    environment: { _ in })
        )
}

// MARK: -  Scope
extension FirstView {
    var secondView: Store<SecondView.State, SecondView.Action> {
        return store.scope(
            state: { $0.secondViewState ?? SecondView.State() },
            action: FirstView.Action.secondView
        )
    }
}
