//
//  ThirdView+State+Reducer.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import Foundation
import ComposableArchitecture

extension ThirdView.State {
    static let reducer = Reducer<ThirdView.State, ThirdView.Action, Void> { state, action, _ in
        switch action {
            case .backToSecondView:
                state.amount = nil
                return .none
        }
    }
}
