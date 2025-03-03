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
    var race: String
    var education: String
    var profession: String
}
