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
    var currentQuestion: Question {
        step.questions[currentQuestionIndex]
    }
    var currentQuestionIndex: Int = 0

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

struct TestQuestionView: View {
   
    let stepVM: TestQuestionViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text(stepVM.currentQuestion.title)
                .font(.title)
                .padding( .bottom, 75)
            HStack {
                
                Spacer()
                Button(stepVM.step.leftTitle) {
                    stepVM.processAnswer(pressedButton: .left)
                }
                .buttonStyle(RoundedButtonStyle(fixedWidth: 150))
                
                Spacer()
                
                Button(stepVM.step.rightTitle) {
                    stepVM.processAnswer(pressedButton: .right)
                }
                .buttonStyle(RoundedButtonStyle(fixedWidth: 150))
            
                Spacer()
                
            }
            
            
        }
        .padding()
        .onChange(of: stepVM.presentNextStep) { _, newValue in
            if newValue {
                coordinator.pushNext(to: .testQuestion(step: stepVM.step))
            }
        }
    }

}

#Preview {
    TestQuestionView(stepVM: .init(step: .mockStep2))
        .environmentObject(AppCoordinator())
    
}

#Preview {
    
    TestQuestionView(stepVM: .init(step: .mockStep1))
        .environmentObject(AppCoordinator())
}


