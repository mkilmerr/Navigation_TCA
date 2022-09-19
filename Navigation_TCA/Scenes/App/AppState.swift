//
//  AppState.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import Foundation
import ComposableArchitecture

struct AppState: Equatable, Identifiable {
    var id = UUID()
    var first: Identified<FirstState.ID, FirstState?>?
    var amount: Int = 0
}

extension AppState {
    var contentViewState: ContentViewState {
        ContentViewState(id: self.id, firstID: self.first?.id, amount: self.amount)
    }
}
