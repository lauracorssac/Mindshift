//
//  RandomABTesting.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 03.03.25.
//

import Foundation

enum Group: String, Encodable, CaseIterable {
    case control, target
}

protocol GroupGenerator {
    func getGroupGenerator() -> Group
}

class RandomGroupGenerator: GroupGenerator {
    func getGroupGenerator() -> Group {
        let options = Group.allCases
        return options.randomElement() ?? .control
    }

}
