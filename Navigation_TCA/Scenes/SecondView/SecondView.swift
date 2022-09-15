//
//  SecondView.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/09/22.
//

import SwiftUI
import ComposableArchitecture

struct SecondView: View {
    let store: Store<State, Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .center, spacing: 20) {
                Text("Second view")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text("Amount : \(viewStore.amount)")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.red)
                Button(action: { viewStore.send(.navigateBackToFirstView)}) {
                    Text("go back to first view")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(store: Store(initialState: .init(), reducer: .empty, environment: ()))
    }
}
