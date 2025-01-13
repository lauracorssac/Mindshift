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
    var startTime: Date?
    var endTime: Date?

    static let mockStep1: Step = .init(
        leftTitle: "carreer",
        rightTitle: "fam",
        introText: "step 1",
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

    static let mockStep2: Step = .init(
        leftTitle: "male",
        rightTitle: "female",
        introText: "step 2",
        questions: [
            .init(title: "harry", answer: .left),
            .init(title: "rony", answer: .left),
            .init(title: "hermine", answer: .right),
            .init(title: "dumbledore", answer: .left),
            .init(title: "luna", answer: .right),
            .init(title: "ginny", answer: .right),
        ]
    )
}
