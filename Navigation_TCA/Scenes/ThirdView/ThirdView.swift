//
//  ThirdView.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import SwiftUI
import ComposableArchitecture

struct ThirdView: View {
    let store: Store<State, Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text("third view")
            }

        }

    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(store: Store(
            initialState: .init(),
            reducer: .empty,
            environment: ()))
    }
}
