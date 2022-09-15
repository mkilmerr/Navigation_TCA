//
//  Navigation_TCAApp.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/09/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct Navigation_TCAApp: App {
    var body: some Scene {
        WindowGroup {
            FirstView(store: Store(initialState: .init(), reducer: FirstView.State.reducer, environment: ()))
        }
    }
}
