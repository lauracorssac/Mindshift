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
    var birthdate: Birthdate
    var race: String
    var education: String
    var profession: String
    var score: Double?
    var classification: String?
}

class UserModel {
    
    static var user = User(
        id: UUID(),
        gender: "",
        birthdate: .init(),
        race: "",
        education: "",
        profession: "",
        score: nil
    )
}
