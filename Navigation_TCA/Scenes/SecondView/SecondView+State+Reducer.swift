//
//  SecondView+State+Reducer.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/09/22.
//

import Foundation
import ComposableArchitecture

extension SecondView.State {
    static let reducer = Reducer<SecondView.State, SecondView.Action, Void> { state, action, _ in
        switch action {
            case .navigateBackToFirstView:
                return .none
        }
    }
}
