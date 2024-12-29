//
//  Classes.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 28.12.24.
//

import Foundation

enum Option {
    case left, right
}

struct Question: Hashable {
    let title: String
    let answer: Option
}

struct Step: Hashable {
    
    let leftTitle: String
    let rightTitle: String
    let introText: String
    let questions: [Question]
    
    static let mockStep: Step = .init(
        leftTitle: "carreer",
        rightTitle: "fam",
        introText: "hello hello",
        questions: [
            .init(title: "emilia", answer: .right),
            .init(title: "nino", answer: .left),
            .init(title: "umay", answer: .right),
            .init(title: "laura", answer: .right),
            .init(title: "alara", answer: .right),
            .init(title: "krusche", answer: .left),
            .init(title: "belemir", answer: .right),
        ]
    )
}
