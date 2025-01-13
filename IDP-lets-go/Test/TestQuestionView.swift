//
//  TestQuestionView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

import SwiftUI

struct TestQuestionView: View {
    let selectedCategory1: String
    let selectedCategory2: String
    
    @State var randomCategory: String = ""
    @State var randomQuestion: String = ""
    
    var body: some View {
        VStack {
            Text(randomQuestion)
                .font(.title)
                .padding( .bottom, 75)
            HStack {
                Button(selectedCategory1) {
                    
                }
                .buttonStyle(RoundedButtonStyle())
                .padding(.trailing, 15)
                Button(selectedCategory2) {
                }
                .buttonStyle(RoundedButtonStyle())
            }
            
        }.padding()
            .onAppear {
                pickRandomCategoryAndQuestion()
            }
    }
    
    private func questions(for category: String) -> [String] {
        var result = [String]()
        
        if category.contains("Male") {
            result.append(contentsOf: TestFields.maleQuestions)
        }
        if category.contains("Female") {
            result.append(contentsOf: TestFields.femaleQuestions)
        }
        if category.contains("Career") {
            result.append(contentsOf: TestFields.careerQuestions)
        }
        if category.contains("Family") {
            result.append(contentsOf: TestFields.familyQuestions)
        }
        
        return result
    }
    
    private func pickRandomCategoryAndQuestion() {
        if let selectedCategory = [selectedCategory1, selectedCategory2].randomElement() {
            randomCategory = selectedCategory
            let matchingQuestions = questions(for: selectedCategory)
            
            if let selectedQuestion = matchingQuestions.randomElement() {
                randomQuestion = selectedQuestion
            }
        }
    }
}

#Preview {
    TestQuestionView(selectedCategory1: "Family", selectedCategory2: "Career")
        .environmentObject(AppCoordinator())
}


