//
//  FirstView+State.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/09/22.
//

import Foundation

extension FirstView {
    struct State: Equatable {
        var amount: Int = 0
        var secondViewState: SecondView.State?
    }
}
