//
//  FirstView.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/09/22.
//

import SwiftUI
import ComposableArchitecture

struct FirstView: View {
    let store: Store<State, Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack(alignment: .center, spacing: 20) {
                    Text("First view")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    NavigationLink(
                        destination: SecondView(store: secondView),
                        isActive: viewStore.binding(
                            get: { $0.secondViewState != nil },
                            send : .didDismissSecondView
                        )
                    ) {
                        Button(action: {
                            viewStore.send(.presentSecondView)
                        }) {
                            Text("go to second view")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                    }

                    
                    HStack {
                        Button(action: {viewStore.send(.plus)}) {
                            Image(systemName: "plus.circle")
                        }

                        Text("\(viewStore.amount)")

                        Button(action: {viewStore.send(.minus)}) {
                            Image(systemName: "minus.circle")
                        }
                    }
                }
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(store: Store(initialState: .init(secondViewState: nil), reducer: .empty, environment: ()) )
    }
}
