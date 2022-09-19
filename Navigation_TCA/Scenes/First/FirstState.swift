//
//  FirstState.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import Foundation
import ComposableArchitecture

struct FirstState: Equatable, Identifiable {
    var id = UUID()
    var second: Identified<SecondState.ID, SecondState?>?
}

