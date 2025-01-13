//
//  TestQuestionView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

import SwiftUI

struct TestQuestionView: View {
    let categories: [String] = ["Family", "Career", "Male", "Female", "Male or Family", "Female or Career", "Male or Career", "Female or Family"]
    let maleQuestions: [String] = ["Ben", "Paul", "Daniel", "John", "Jeffrey"]
    let femaleQuestions: [String] = ["Rebecca", "Michelle", "Emily", "Julia", "Anna"]
    let careerQuestions: [String] = [ "Career", "Corporation", "Salary", "Office", "Professional", "Management", "Business"]
    let familyQuestions: [String] = ["Wedding", "Marriage", "Parents", "Relatives", "Family", "Home", "Children"]
    let selectedCategory1: String
    let selectedCategory2: String
    
    let partOneCategories: [String] = ["Family", "Career"]
    let partTwoCategories: [String] = ["Male", "Female"]
    let partThreeCategories: [String] = ["Male or Family", "Female or Career"]
    let partFourCategories: [String] = ["Male or Family", "Female or Career"]
    let partFiveCategories: [String] = ["Male or Career", "Female or Career"]
    let partSixCategories: [String] = ["Male or Career", "Female or Career"]
    let partSevenCategories: [String] = ["Male or Career", "Female or Career"]
    
    var body: some View {
        VStack {
            Text(maleQuestions[0])
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
    }
    private func questions(for category: String) -> [String] {
            var result = [String]()
            
            if category.contains("Male") {
                result.append(contentsOf: maleQuestions)
            }
            if category.contains("Female") {
                result.append(contentsOf: femaleQuestions)
            }
            if category.contains("Career") {
                result.append(contentsOf: careerQuestions)
            }
            if category.contains("Family") {
                result.append(contentsOf: familyQuestions)
            }
            
            return result
        }
}

#Preview {
    TestQuestionView(selectedCategory1: "Family", selectedCategory2: "Career")
        .environmentObject(AppCoordinator())
}


