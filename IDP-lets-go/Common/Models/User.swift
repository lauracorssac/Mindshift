//
//  User.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.01.25.
//

import Foundation

struct User: Codable {
    let id: UUID
    var gender: String
    var birthYear: String
    var races: Set<String>
    var education: String
    var professions: Set<String>
    var score: Double?
    var classification: String?
}

class UserModel {
    
    static var user = User(
        id: UUID(),
        gender: "",
        birthYear: "",
        races: [""],
        education: "",
        professions: [""],
        score: nil
    )
}
