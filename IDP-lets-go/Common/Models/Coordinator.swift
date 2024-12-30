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
         testQuestion(step: Step), final
    
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
        case .final, .testStart, .testQuestion(step: _), .testStepIntro(step: _):
            nil
        }
    }
}

class GameCoordinator {
    
    private var steps: [Step] = [Step.mockStep1, Step.mockStep2]
    private var currentStep = 0
    
    func getInitialScreen() -> Screen {
        return .testStepIntro(step: steps[currentStep])
    }
    
    func getNextStep() -> Screen? {
        stopTimer()
        guard currentStep < steps.count - 1 else { return nil }
        currentStep += 1
        return .testStepIntro(step: steps[currentStep])
    }
    
    func getQuestions() -> Screen {
        startTimer()
        return .testQuestion(step: steps[currentStep])
    }
    
    private func startTimer() {
        steps[currentStep].startTime = Date()
    }
    
    private func stopTimer() {
        steps[currentStep].endTime = Date()
    }
    
    func debugAnalysisPrint() {
        for (ind, step) in steps.enumerated() {
            guard let startTime = step.startTime,
                  let endTime = step.endTime else { continue }
            print("step \(ind): ", endTime.timeIntervalSince(startTime))
        }
    }
    
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    var gameCoordinator: GameCoordinator?
    var isFirstTest = true
    
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
               // if isFirstTest {
                  //  self.push(.meditationStart)
               // } else {
                self.push(.final)
                gameCoordinator?.debugAnalysisPrint()
               // }
            }
            
        case let .testStepIntro(step: step):
            guard let screen = gameCoordinator?.getQuestions() else { return }
            self.push(screen)
            
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
            
        case .final:
            FinalView()
        }
    }
}
