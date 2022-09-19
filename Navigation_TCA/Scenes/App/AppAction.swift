//
//  AppAction.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import Foundation

enum AppAction {
    case first(FirstAction)
    case plus
    case minus
    case setNavigation(selection: UUID?)
}
