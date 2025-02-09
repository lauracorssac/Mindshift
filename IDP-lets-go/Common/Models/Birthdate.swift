//
//  Birthdate.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 05.02.25.
//

import Foundation

struct Birthdate: Codable {
    var year: String
    var month: String
    
    init(year: String = "", month: String = "") {
        self.year = year
        self.month = month
    }
    
    func toString() -> String {
        return "\(month)/\(year)"
    }
    
    var isEmpty: Bool {
        return month.isEmpty || year.isEmpty
    }
}
