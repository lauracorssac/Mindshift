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
        guard currentStep < model.steps.count - 1 else { return nil }
        currentStep += 1
        return .testStepIntro(step: model.steps[currentStep], total: model.totalNumberOfSteps)
    }
    
    func getQuestions() -> Screen {
        return .testQuestion(step: model.steps[currentStep])
    }
    
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    var gameCoordinator: GameCoordinator
    let statusManager: UserStatusManager
    let cardsFactory: CardsFactory
    let group: Group
    
    init(
        gameCoordinator: GameCoordinator = GameCoordinator(model: Constants.model),
        groupManager: GroupManager = Constants.groupManager,
        statusManager: UserStatusManager = Constants.statusManager,
        cardsFactory: CardsFactory = Cards()
    ) {
        self.gameCoordinator = gameCoordinator
        self.group = groupManager.userGroup
        self.cardsFactory = cardsFactory
        self.statusManager = statusManager
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
            self.push(gameCoordinator.getInitialScreen())
            
        case .testQuestion(step: _):
            if let nextStep = gameCoordinator.getNextStep() {
                self.push(nextStep)
            } else {
                self.push(.questionsStart)
                statusManager.completeStep(screen: .questionsStart, userGroup: group)
            }
            
        case .testStepIntro(step: _):
            let screen = gameCoordinator.getQuestions()
            self.push(screen)
            
        default:
            if let next = screen.nextScreen(
                userStatusManager: statusManager,
                userGroup: group
            ) {
                
                self.push(next)
                statusManager.completeStep(screen: next, userGroup: group)
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
            OverviewPageView(cards: cardsFactory.getCards(userGroup: group))
            
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
            TestQuestionView(stepVM: .init(step: step, currentStageIndex: step.stepNumber - 1))
            
        case .questionsStart:
            ScenariosStartView()
            
        case .questions:
            ScenarioView()
            
        case .final:
            FinalView(viewModel: FinalViewModelImpl())
        }
    }
}
