//
//  Screen.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 28.01.25.
//

import Foundation

enum Screen: Hashable {
    
    case welcome, onboarding, consent, demographics, demographicsFinal, overview,
         meditationStart, meditation, meditationEnd, testStart, testStepIntro(step: Step),
         testQuestion(step: Step), final, clouds, testTableView
    
    func nextScreen(userStatusManager: UserStatusManager) -> Screen? {
        
        switch self {
        case .welcome:
            return .onboarding
        case .onboarding:
            if userStatusManager.hasAlreadyConsent {
                return .demographics
            } else {
                return .consent
            }
                
        case .consent:
            return .demographics
        case .demographics:
            return .demographicsFinal
        case .demographicsFinal:
            return .overview
        case .overview:
            return .testStart
        case .meditationStart:
            return .clouds
        case .clouds:
            return .meditation
        case .meditation:
            return .meditationEnd
        case .meditationEnd:
            return .testStart
        case .testStart:
            return .testTableView
        
        case .final, .testTableView, .testQuestion(step: _), .testStepIntro(step: _):
            return nil
        }
    }
}

extension Screen {
    
    func shouldHideBackButton() -> Bool {
        switch self {
        case .consent, .demographicsFinal, .overview, .meditationStart, .final,
                .testQuestion(step: _):
            return true
        case let .testStepIntro(step: step):
            return !step.isFirst
        default:
            return false
        }
    }
    
    func getUpdatedStatus(isFirstTest: Bool) -> UserStatus? {
        switch self {
        case .demographics:
            return .demographics
        case .demographicsFinal:
            return .firstTest
        case .meditationStart:
            return .firstMeditation
        case .meditationEnd:
            return .meditationRepetition
        case .testStart:
            if !isFirstTest {
                return .secondTest
            }
            return nil
        case .final:
            return .end
        default:
            return nil
        }
    }
}
