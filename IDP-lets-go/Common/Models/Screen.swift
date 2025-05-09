//
//  Screen.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 28.01.25.
//

import Foundation

enum Screen: Hashable {
    
    case welcome, onboarding, consent, demographics, demographicsFinal, overview,
         meditationStart, meditation, meditationEnd, testStart, testStepIntro(step: Step, total: Int),
         testQuestion(step: Step), final, clouds, testTableView, questionsStart, questions
    
    func nextScreen(
        userStatusManager: UserStatusManager,
        userGroup: Group
    ) -> Screen? {
        
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
            if userGroup == .control {
                return .testStart
            } else {
                return .meditationStart
            }
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
        case .questionsStart:
            return .questions
        case .questions:
            return .final
        
        case .final, .testTableView, .testQuestion(step: _), .testStepIntro(step: _):
            return nil
        }
    }
}

extension Screen {
    
    func shouldHideBackButton() -> Bool {
        switch self {
        case .consent, .demographics, .demographicsFinal, .overview, .meditationStart, .final,
                .testQuestion(step: _), .clouds, .meditation, .meditationEnd, .questionsStart, .testStart, .questions:
            return true
        case let .testStepIntro(step, _):
            return !step.isFirst
        default:
            return false
        }
    }
    
    func getUpdatedStatus(userGroup: Group) -> UserStatus? {
        switch self {
        case .demographics:
            return .demographics
        case .demographicsFinal:
            if userGroup == .control {
                return .test
            } else {
                return .firstMeditation
            }
        case .meditationEnd:
            return .meditationRepetition
        case .testStart:
            return .test
        case .questionsStart:
            return .questions
        case .final:
            return .end
        default:
            return nil
        }
    }
}
