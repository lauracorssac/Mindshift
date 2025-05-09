//
//  TestQuestionView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

import SwiftUI

@Observable
class TestQuestionViewModel {
    
    let step: Step
    var presentNextStep = false
    var presentWrongMark = false
    var currentQuestion: Question {
        step.questions[currentQuestionIndex]
    }
    var currentQuestionIndex: Int = 0
    
    var questionStartTime: Date = Date()
    var trials: [Trial] = []
    var currentStageIndex: Int
    let totalStages: Int = 6

    
    init(step: Step, presentWrongMark: Bool = false, currentStageIndex: Int) {
        self.step = step
        self.presentWrongMark = presentWrongMark
        self.currentStageIndex = currentStageIndex
        questionStartTime = Date()
    }
    
    func processAnswer(pressedButton: Option) {
        if currentQuestion.answer == pressedButton {
            presentWrongMark = false
            let elapsedTime = Int(Date().timeIntervalSince(questionStartTime) * 1000)
            let trial = Trial(step: step.stepNumber, responseTime: elapsedTime)
            print("Recoded trial: step= \(trial.step), responseTime=\(trial.responseTime)")
            trials.append(trial)
            
            if currentQuestionIndex == step.questions.count - 1 {
                ScoreManager.shared.addTrials(trials)
                trials.removeAll()
                if currentStageIndex == totalStages {
                    ScoreManager.shared.computeAndAssignScore()
                    print ("All stages completed")
                }
                presentNextStep = true
            } else {
                currentQuestionIndex += 1
                questionStartTime = Date()
            }
        } else {
            presentWrongMark = true
        }
    }
}

struct TestQuestionView: View {
    
    let stepVM: TestQuestionViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            
            Spacer()
            Text(stepVM.currentQuestion.title)
                .id(stepVM.currentQuestion.id)
                .transition(.asymmetric(
                    insertion: .scale,
                    removal: .scale
                ))
                .font(.title)
                .padding( .bottom, 50)
            HStack {
                
                Spacer()
                Button(stepVM.step.leftTitle) {
                    stepVM.processAnswer(pressedButton: .left)
                }
                .buttonStyle(RoundedButtonStyle(
                    fixedWidth: 140,
                    fixedHeight: 45)
                )
                
                Spacer()
                
                Button(stepVM.step.rightTitle) {
                    stepVM.processAnswer(pressedButton: .right)
                }
                .buttonStyle(RoundedButtonStyle(
                    fixedWidth: 140,
                    fixedHeight: 45)
                )
                
                Spacer()
                
            }
            
            Spacer()
               
        }
        .animation(
            .easeInOut(duration: 0.05),
            value: stepVM.currentQuestion
        )
        .overlay {
            VStack {
                Spacer()
                if stepVM.presentWrongMark {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                        .padding(.top, 80)
                        .foregroundStyle(Color.red)
                }
                
            }
            .padding(.bottom, 100)
        }
       
        .onChange(of: stepVM.presentNextStep) { _, newValue in
            if newValue {
                coordinator.pushNext(to: .testQuestion(step: stepVM.step))
            }
        }
    }
    
}

#Preview {
    TestQuestionView(stepVM: .init(step: .mockStep2, currentStageIndex: 0))
        .environmentObject(AppCoordinator())
    
}

#Preview {
    TestQuestionView(stepVM: .init(
        step: .mockStep1,
        presentWrongMark: true,
        currentStageIndex: 0)
    )
    .environmentObject(AppCoordinator())
}
