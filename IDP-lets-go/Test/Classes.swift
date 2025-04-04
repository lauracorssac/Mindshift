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
    let id = UUID()
    let title: String
    let answer: Option
}

struct Step: Hashable {

    let stepNumber: Int
    let leftTitle: String
    let rightTitle: String
    let introText: String
    let questions: [Question]
    var startTime: Date?
    var endTime: Date?
    
    var isFirst: Bool {
        return stepNumber == 1
    }

    static let mockStep1: Step = .init(
        stepNumber: 1,
        leftTitle: "carreer",
        rightTitle: "fam",
        introText: "step 1",
        questions: [
            .init(title: "nino", answer: .right),
            .init(title: "nino", answer: .right),
            .init(title: "nino", answer: .right),
        ]
    )

    static let mockStep2: Step = .init(
        stepNumber: 2,
        leftTitle: "male or\ncareer",
        rightTitle: "female or\nfamily",
        introText: "step 2",
        questions: [
            .init(title: "harry", answer: .left),
            .init(title: "rony", answer: .left),
        ]
    )
}
