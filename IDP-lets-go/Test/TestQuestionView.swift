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
    
        var body: some View {
        VStack {
            Text(TestFields.maleQuestions[0])
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
}

#Preview {
    TestQuestionView(selectedCategory1: "Family", selectedCategory2: "Career")
        .environmentObject(AppCoordinator())
}


