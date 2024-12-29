//
//  Coordinator.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum Screen: Hashable {
    
    case overview, consent, name, gender, birthdate, profession, education,
         meditationStart, meditation, meditationEnd, testStart, testStepIntro(step: Step),
         testQuestion(step: Step)
    
    func nextScreen() -> Screen? {
        
        switch self {
        case .overview:
            .consent
        case .consent:
            .name
        case .name:
            .gender
        case .gender:
            .birthdate
        case .birthdate:
            .profession
        case .profession:
            .education
        case .education:
            .meditationStart
        case .meditationStart:
            .meditation
        case .meditation:
            .meditationEnd
        case .meditationEnd:
            .testStart
        case let .testStepIntro(step: step):
            .testQuestion(step: step)
        case .testStart, .testQuestion(step: _):
            nil
        }
        
    }
}

class GameCoordinator {
    
    private let steps: [Step] = [Step.mockStep, Step.mockStep]
    private var currentStep = 0
    
    func getInitialScreen() -> Screen {
        return .testStepIntro(step: steps[currentStep])
    }
    
    func getNextStep() -> Screen? {
        
        guard currentStep < steps.count - 1 else { return nil }
        currentStep += 1
        return .testStepIntro(step: steps[currentStep])
    }
    
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    var gameCoordinator: GameCoordinator?
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pushNext(to screen: Screen) {
        
        switch screen {
        case .testStart:
            gameCoordinator = GameCoordinator()
            self.push(gameCoordinator!.getInitialScreen())
            
           
        case .testQuestion(step: _):
            if let nextStep = gameCoordinator?.getNextStep() {
                self.push(nextStep)
            } else {
                // end test
            }
            
        default:
            if let next = screen.nextScreen() {
                self.push(next)
            }
        }
        
        
    }
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
            
        case .overview:
            OverviewPageView(cards: Overview().allCards)
            
        case .consent:
            // TODO: change to real text
            ConsentView(consentText: Consent().text)
            
        case .name:
            NameQuestionView()
            
        case .gender:
            GenderQuestionView()
            
        case .birthdate:
            BirthdateQuestionView()
            
        case .education:
            EducationQuestionView()
        
        case .profession:
            ProfessionQuestionView()
            
        case .meditationStart:
            MeditationStartView()
            
        case .meditation:
            MeditationAudioView()
        
        case .meditationEnd:
            MeditationEndView()
        
        case .testStart:
            TestStartView()
            
        case let .testStepIntro(step):
            IntroStepView(step: step)
            
        case let .testQuestion(step):
            StepQuestionView(stepVM: .init(step: step))
        }
    }
}
