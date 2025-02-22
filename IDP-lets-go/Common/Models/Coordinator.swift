//
//  Coordinator.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

class GameCoordinator {
    
    private var model: TestModel
    private var currentStep = 0
    
    init(model: TestModel, currentStep: Int = 0) {
        self.model = model
        self.currentStep = currentStep
    }
    
    func getInitialScreen() -> Screen {
        return .testStepIntro(step: model.steps[currentStep], total: model.totalNumberOfSteps)
    }
    
    func getNextStep() -> Screen? {
        stopTimer()
        guard currentStep < model.steps.count - 1 else { return nil }
        currentStep += 1
        return .testStepIntro(step: model.steps[currentStep], total: model.totalNumberOfSteps)
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
    let model: TestModel
    let statusManager = UserStatusManager.shared
    
    var isFirstTest: Bool {
        statusManager.isFirstTest()
    }
    
    init(
        path: NavigationPath = NavigationPath(),
        gameCoordinator: GameCoordinator? = nil,
        model: TestModel = SequecedModel()
    ) {
        self.path = path
        self.gameCoordinator = gameCoordinator
        self.model = model
    }
    
    func getInitialScreen() -> Screen {
        return statusManager.currentStatus.getScreen()
    }
    
    
    func push(_ screen: Screen) {
        withTransaction(Transaction(animation: nil)) {
            path.append(screen)
        }
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
                
                if isFirstTest {
                    self.push(.meditationStart)
                    statusManager.completeStep(screen: .meditationStart)
                } else {
                    self.push(.final)
                    gameCoordinator?.debugAnalysisPrint()
                    statusManager.completeStep(screen: .final)
                }
            }
            
        case .testStepIntro(step: _):
            guard let screen = gameCoordinator?.getQuestions() else { return }
            self.push(screen)
            
        default:
            if let next = screen.nextScreen(userStatusManager: statusManager) {
                
                self.push(next)
                
                statusManager.completeStep(screen: next)
            }
        }
    }
    
    @ViewBuilder
    func build(screen: Screen) -> some View {
        
        build(screen)
            .navigationBarBackButtonHidden(
                screen.shouldHideBackButton()
            )
    }
    
    
    @ViewBuilder
    private func build(_ screen: Screen) -> some View {
        switch screen {
        case .welcome:
            WelcomeView()
        
        case .onboarding:
            OnboardingView()
            
        case .consent:
            ConsentView(consentText: Consent().text)
        
        case .demographics:
            DemographicsWrapperView(viewModel: .init())
            
        case .demographicsFinal:
            DemographicsFinalView()
            
        case .overview:
            OverviewPageView(cards: Overview().allCards)
            
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
            
        case let .testStepIntro(step, total):
            TestPartIndicatorView(step: step, totalNumberOfSteps: total)
            
        case let .testQuestion(step):
            TestQuestionView(stepVM: .init(step: step))
            
        case .final:
            FinalView()
        }
    }
}
