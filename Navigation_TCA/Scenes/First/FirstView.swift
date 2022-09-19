//
//  File.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import SwiftUI
import ComposableArchitecture

struct FirstView: View {
    let store: Store<FirstState, FirstAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                NavigationLink(
                    tag: viewStore.id,
                    selection: viewStore.binding(
                        get: \.second?.id,
                        send: FirstAction.setNavigation(selection:))
                ) {
                    IfLetStore(store.scope(
                        state: \.second?.value,
                        action: FirstAction.second
                    ), then: SecondView.init(store:))
                } label: {
                    Text("push second view")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationTitle("First View")
    }
}
