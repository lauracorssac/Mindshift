//
//  User.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.01.25.
//

import Foundation

struct User: Codable {
    let id: UUID
    var gender: Gender
    var birthdate: String
    var race: String
    var education: EducationBackground?
    var profession: String
}

class UserModel {
    
    static var user = User(
        id: UUID(),
        gender: .none,
        birthdate: "",
        race: "",
        education: nil,
        profession: ""
    )
}
