//
//  ThirdState+Reducer.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import Foundation
import ComposableArchitecture

extension ThirdState {
    static let reducer = Reducer<ThirdState, ThirdAction, Void> { state, action, _ in
        return .none
    }
}
