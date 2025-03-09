//
//  UserStatus.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 24.01.25.
//

import Foundation

enum UserStatus: String {
    case consent, demographics, firstMeditation, meditationRepetition, test, questions, end
}

extension UserStatus {
    
    func getScreen() -> Screen {
        switch self {
        case .consent:
            return .welcome
        case .demographics:
            return .onboarding
        case .test:
            return .overview
        case .firstMeditation:
            return .meditationStart
        case .meditationRepetition:
            return .meditationEnd
        case .questions:
            return .questionsStart
        case .end:
            return .final
        }
    }
}
