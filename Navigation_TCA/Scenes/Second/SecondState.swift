//
//  SecondState.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import Foundation
import ComposableArchitecture

struct SecondState: Equatable, Identifiable {
    var id = UUID()
    var third: Identified<ThirdState.ID, ThirdState?>?
}
