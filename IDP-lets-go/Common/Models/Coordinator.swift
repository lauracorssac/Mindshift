//
//  Coordinator.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum Screen: Hashable {
    
    case welcome, overview, consent, onboarding, race, gender, birthdate, profession, education,
         meditationStart, meditation, meditationEnd, testStart, testStepIntro(step: Step),
         testQuestion(step: Step), final, clouds, testTableView
    
    func nextScreen() -> Screen? {
        
        switch self {
        case .welcome:
                .overview
        case .overview:
            .consent
        case .consent:
                .onboarding
        case .onboarding:
                .gender
        case .gender:
            .birthdate
        case .birthdate:
            .profession
        case .profession:
            .education
        case .education:
            .race
        case .race:
            .meditationStart
        case .meditationStart:
            .clouds
        case .clouds:
            .meditation
        case .meditation:
            .meditationEnd
        case .meditationEnd:
            .testStart
        
        case .testStart:
            .testTableView
        
        case .final, .testTableView, .testQuestion(step: _), .testStepIntro(step: _):
            nil
        }
    }
}

class GameCoordinator {
    
    //private var steps: [Step] = [Step.mockStep1, Step.mockStep2]
    
    private var model: TestModel
    private var currentStep = 0
    
    init(model: TestModel, currentStep: Int = 0) {
        self.model = model
        self.currentStep = currentStep
    }
    
    func getInitialScreen() -> Screen {
        return .testStepIntro(step: model.steps[currentStep])
    }
    
    func getNextStep() -> Screen? {
        stopTimer()
        guard currentStep < model.steps.count - 1 else { return nil }
        currentStep += 1
        return .testStepIntro(step: model.steps[currentStep])
    }
    
    func getQuestions() -> Screen {
        startTimer()
        return .testQuestion(step: model.steps[currentStep])
    }
    
    private func startTimer() {
        model.steps[currentStep].startTime = Date()
    }
    
    private func stopTimer() {
        model.steps[currentStep].endTime = Date()
    }
    
    func debugAnalysisPrint() {
        for (ind, step) in model.steps.enumerated() {
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
    let model: TestModel
    
    init(path: NavigationPath = NavigationPath(), gameCoordinator: GameCoordinator? = nil, isFirstTest: Bool = true, model: TestModel = SequecedModel()) {
        self.path = path
        self.gameCoordinator = gameCoordinator
        self.isFirstTest = isFirstTest
        self.model = model
    }
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pushNext(to screen: Screen) {
        
        switch screen {
        case .testTableView:
            gameCoordinator = GameCoordinator(model: model)
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
            
        case .testStepIntro(step: _):
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
        case .welcome:
            WelcomeView()
            
        case .overview:
            OverviewPageView(cards: Overview().allCards)
            
        case .consent:
            // TODO: change to real text
            ConsentView(consentText: Consent().text)
            
        case .onboarding:
            OnboardingView()
            
        case .race:
            RaceQuestionView()
            
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
            
        case .clouds:
            MeditationCloudsView()
            
        case .meditation:
            MeditationAudioView()
        
        case .meditationEnd:
            MeditationEndView()
        
        case .testStart:
            TestInformationView()
            
        case .testTableView:
            TestTableView()
            
        case let .testStepIntro(step):
            TestPartIndicatorView(step: step)
            
        case let .testQuestion(step):
            TestQuestionView(stepVM: .init(step: step))
            
        case .final:
            FinalView().navigationBarBackButtonHidden()
        }
    }
}
