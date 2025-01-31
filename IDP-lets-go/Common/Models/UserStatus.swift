//
//  UserStatus.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 24.01.25.
//

import Foundation

enum UserStatus: String {
    case consent, demographics, firstTest, firstMeditation, meditationRepetition, secondTest, end
    
}

extension UserStatus {
    
    func getScreen() -> Screen {
        switch self {
        case .consent:
            return .welcome
        case .demographics:
            return .onboarding
        case .firstTest:
            return .testStart
        case .firstMeditation:
            return .meditationStart
        case .meditationRepetition:
            return .meditationEnd
        case .secondTest:
            return .testStart
        case .end:
            return .final
        }
    }
}
