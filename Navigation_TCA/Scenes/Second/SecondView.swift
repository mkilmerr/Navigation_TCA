//
//  SecondScopeNavigation.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import SwiftUI
import ComposableArchitecture

struct SecondView: View {
    let store: Store<SecondState, SecondAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                NavigationLink(
                    tag: viewStore.id,
                    selection: viewStore.binding(
                        get: \.third?.id,
                        send: SecondAction.navigateToThirdView)
                ) {
                    IfLetStore(store.scope(
                        state: \.third?.value,
                        action: SecondAction.third
                    ), then: ThirdView.init(store:))
                } label: {
                    Text("push to third screen")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Second View")
        }
    }
}
