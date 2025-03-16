//
//  Race.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 05.02.25.
//

import Foundation

enum Race: String, CaseIterable, Identifiable {
    
    var id: String {
        self.rawValue
    }
    
    case white = "white"
    case hispanicOrLatino = "hispanic"
    case black = "black"
    case indigenous = "indigenous"
    case asian = "asian"
    case middleEasternNorthAfrican = "middleEastern"
    case other = "other"
    
    func displayName() -> String {
        switch self {
        case .white:
            return "White"
        case .hispanicOrLatino:
            return "Hispanic / Latino"
        case .black:
            return "Black"
        case .indigenous:
            return "Indigenous"
        case .asian:
            return "Asian"
        case .middleEasternNorthAfrican:
            return "Middle Eastern / North African"
        case .other:
            return "Other / Prefer not to say"
        }
    }
}
