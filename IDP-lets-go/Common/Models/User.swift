//
//  User.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.01.25.
//

import Foundation

struct Answer: Encodable {
    let mostIndex: Int
    let leastIndex: Int
}

struct User: Encodable {
    let id: UUID
    var gender: String
    var birthYear: String
    var races: Set<String>
    var education: String
    var professions: Set<String>
    var score: Double?
    var trials: Set<Trial>
    var answers: [Answer]
    var group: Group
    var meditationSessions: Int
}


class UserModel {
    
    private init() {}
    
    static let shared = UserModel()
    
    var user = User(
        id: UUID(),
        gender: "",
        birthYear: "",
        races: [],
        education: "",
        professions: [],
        score: nil,
        trials: [],
        answers: Array(repeating: Answer(mostIndex: -1, leastIndex: -1), count: 10),
        group: .control,
        meditationSessions: 0
    )
}
