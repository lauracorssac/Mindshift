//
//  Education.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 05.02.25.
//

import Foundation

enum EducationBackground: String, CaseIterable, Identifiable, Codable {
    var id: String {
        return self.rawValue
    }
    
    case noFormalEducation = "no_formal"
    case elementarySchool = "elementary_school"
    case highSchool = "high_school"
    case apprenticeship = "apprenticeship"
    case bachelorsDegree = "bachelors"
    case mastersDegree = "masters"
    case doctorate = "doctorate"
    
    func displayName() -> String {
        switch self {
        case .noFormalEducation:
            return "No formal education"
        case .elementarySchool:
            return "Elementary school"
        case .apprenticeship:
            return "Apprenticeship / Ausbildung"
        case .bachelorsDegree:
            return "Bachelor's degree"
        case .mastersDegree:
            return "Master's degree"
        case .doctorate:
            return "Ph.D or higher"
        case .highSchool:
            return "High School / Abitur"
        }
    }
}
