//
//  TestQuestionView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

import SwiftUI
struct TestQuestionView: View {
    let category1: String
    let category2: String
    let question: String
    
    var body: some View {
        VStack {
            Text(question)
                .font(.title)
                .padding( .bottom, 75)
            HStack {
                Button(category1) {
                    
                }
                .buttonStyle(RoundedButtonStyle())
                .padding(.trailing, 15)
                Button(category2) {
                }
                .buttonStyle(RoundedButtonStyle())
                }
                
        }.padding()
    }
}

#Preview {
    TestQuestionView(category1: "Family", category2: "Career", question: "Salary")
        .environmentObject(AppCoordinator())
}


