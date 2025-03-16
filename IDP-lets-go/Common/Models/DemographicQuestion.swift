//
//  DemographicQuestion.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 05.02.25.
//

import Foundation

enum DemographicQuestion: String {
    
    case race, birthdate, gender, educationBackground, mmock, profession
    
    func title() -> String {
        switch self {
            
        case .race:
            "Which ethnicity do you most identify with?"
        case .birthdate:
            "What's your year of birth?"
        case .gender:
            "Which gender do you most identify with?"
        case .educationBackground:
            "What is the highest level of education that you have completed?"
        case .mmock:
            "What's your name?"
        case .profession:
            "What's your field of occupation or studies?"
        }
    }
    
    func items() -> [(String, String)] {
        
        switch self {
            
        case .race:
            return Race.allCases.map { ($0.displayName(), $0.rawValue) }
        case .birthdate:
            let currentYear = Calendar.current.component(.year, from: Date())
            let years = Array((currentYear - 100)...(currentYear - 18)).reversed()
            return years.map { ("\($0)","\($0)") }
        case .gender:
            return Gender.allCases.map { ($0.displayName(), $0.rawValue) }
        case .educationBackground:
            return EducationBackground.allCases.map { ($0.displayName(), $0.rawValue) }
        case .mmock:
            return [("", "")]
        case .profession:
            return Occupation.allCases.map { ($0.displayName(), $0.rawValue) }
        }
    }
    
}
