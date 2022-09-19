//
//  ThirdView.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import SwiftUI
import ComposableArchitecture

struct ThirdView: View {
    let store: Store<ThirdState, ThirdAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Text("third screen")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.brown)
        }

    }
}
