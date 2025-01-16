//
//  TestModel.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 15.01.25.
//

import Foundation

protocol TestModel {
    
    var steps: [Step] { get set }
}

class SequecedModel: TestModel {
    
    var steps: [Step] = [Step.mockStep1, Step.mockStep2]
}

class RandomModel: TestModel {
    
    var steps: [Step]
    
    let numberOfQuestionPerStep = 5
    
    init() {
        
        var steps: [Step] = []
        for (ind, category) in TestFields.categories.enumerated() {
            
            var questions: [Question] = []
            
            for _ in 0..<numberOfQuestionPerStep {
                let (randomCategory, selectedQuestion) = TestFields
                    .pickRandomCategoryAndQuestion(categories: category)
                
                let question = Question(title: selectedQuestion, answer: randomCategory)
                questions.append(question)
            }
            
            let step = Step(
                stepNumber: ind + 1,
                leftTitle: category[0],
                rightTitle: category[1],
                introText: "",
                questions: questions
            )
            
            steps.append(step)
        }
        
        self.steps = steps
        
    }
}
