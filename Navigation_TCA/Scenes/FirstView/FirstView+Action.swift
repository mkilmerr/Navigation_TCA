//
//  FirstView+Action.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/09/22.
//

import Foundation

extension FirstView {
    enum Action: Equatable {
        case presentSecondView
        case didDismissSecondView
        case plus
        case minus 
        case secondView(SecondView.Action)
    }
}
