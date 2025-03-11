//
//  TestQuestionViewmodel.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 11.03.25.
//
import Foundation

@Observable
class TestQuestionViewModel {
    let step: Step
    var presentNextStep = false
    var currentQuestion: Question {
        step.questions[currentQuestionIndex]
    }
    var currentQuestionIndex: Int = 0
    var questionStartTime: Date = Date()
    // Store trials in addition to response times
    var trials: [Trial] = []

    init(step: Step) {
        self.step = step
        questionStartTime = Date()
    }

    func processAnswer(pressedButton: Option) {
        if currentQuestion.answer == pressedButton {
            let elapsedTime = Int(Date().timeIntervalSince(questionStartTime) * 1000)
            // Record a trial with the step number from your Step object
            let trial = Trial(step: step.stepNumber, responseTime: elapsedTime)
            trials.append(trial)

            print("Response time for question \(currentQuestionIndex): \(elapsedTime) ms")
            if currentQuestionIndex == step.questions.count - 1 {
                presentNextStep = true
            } else {
                currentQuestionIndex += 1
                questionStartTime = Date()
            }
        }
    }
}
