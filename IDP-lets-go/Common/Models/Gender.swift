//
//  Gender.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 05.02.25.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable, Codable {
    var id: String {
        self.rawValue
    }
    
    case man, woman, nonBinary, other
    
    func displayName() -> String {
        switch self {
            
        case .man:
            "Man"
        case .woman:
            "Woman"
        case .nonBinary:
            "Non Binary/Agender/Queer"
        case .other:
            "Other / Prefer not to say"
        }
    }
}
