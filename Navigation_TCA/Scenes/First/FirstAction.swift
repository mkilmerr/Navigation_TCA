//
//  FirstAction.swift
//  Navigation_TCA
//
//  Created by Marcos Kilmer Pereira de Aquino on 19/09/22.
//

import Foundation

enum FirstAction {
    case second(SecondAction)
    case setNavigation(selection: UUID?)
}
