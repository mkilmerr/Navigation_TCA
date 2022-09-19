//
//  AppView.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import SwiftUI
import ComposableArchitecture

struct ContentViewState: Equatable {
    var id: UUID
    var firstID: FirstState.ID?
    var amount: Int
}

struct ContentView: View {
    let store: Store<AppState, AppAction>

    var body: some View {
        NavigationView {
            WithViewStore(store.scope(state: \.contentViewState)) { viewStore in
                VStack {
                    NavigationLink(
                        tag: viewStore.state.id,
                        selection: viewStore.binding(
                            get: \.firstID,
                            send: AppAction.setNavigation(selection:))
                    ) {
                        IfLetStore(store.scope(
                            state: \.first?.value,
                            action: AppAction.first
                        ), then: FirstView.init(store:))
                    } label: {
                        Text("Push")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.orange)
                    }

                    HStack {
                        Button(action: { viewStore.send(.plus)}) {
                            Image(systemName: "plus")
                                .foregroundColor(.blue)
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                        }

                        Text("\(viewStore.amount)")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .padding()

                        Button(action: { viewStore.send(.minus)}) {
                            Image(systemName: "minus")
                                .foregroundColor(.red)
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                        }
                    }
                    .padding()
                }
                .navigationTitle("Root View")
            }
        }
    }
}
