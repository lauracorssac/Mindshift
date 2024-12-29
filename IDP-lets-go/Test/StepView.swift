//
//  SimpleView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 28.12.24.
//

import SwiftUI

class StepQuestionViewModel: ObservableObject {
    
    let step: Step
    @Published var presentNextStep = false
    var currentQuestion: Question {
        step.questions[currentQuestionIndex]
    }
    @Published var currentQuestionIndex: Int = 0
    
    init(step: Step) {
        self.step = step
    }
    
    func processAnswer(pressedButton: Option) {
        if currentQuestion.answer == pressedButton {
            if currentQuestionIndex == step.questions.count - 1 {
                presentNextStep = true
            } else {
                currentQuestionIndex += 1
            }
        }
    }
}

struct StepQuestionView: View {
    
    @ObservedObject var stepVM: StepQuestionViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text(stepVM.currentQuestion.title)
            HStack {
                Button(stepVM.step.leftTitle) {
                    stepVM.processAnswer(pressedButton: .left)
                }
                Button(stepVM.step.rightTitle) {
                    stepVM.processAnswer(pressedButton: .right)
                }
            }
            
        }.onChange(of: stepVM.presentNextStep) { _, newValue in
            if newValue {
                coordinator.pushNext(to: .testQuestion(step: stepVM.step))
            }
        }
    }
}
