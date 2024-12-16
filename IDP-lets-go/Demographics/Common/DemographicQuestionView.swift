//
//  DemographicQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct DemographicQuestion {
    let title: String
    
    static let name = DemographicQuestion
        .init(title: "What's your name?")
    
    static let birthdate = DemographicQuestion
        .init(title: "What's your birthdate?")
    
    static let gender = DemographicQuestion
        .init(title: "What's your gender?")
    
    static let educationBackground = DemographicQuestion
        .init(title: "What's your highest education background?")
    
    static let profession = DemographicQuestion
        .init(title: "What's your profession?")
    
    static let mock = DemographicQuestion
        .init(title: "What's your name?")
}

struct DemographicQuestionView<Content: View>: View {
    
    let demographicQuestion: DemographicQuestion
    let buttonPressed: () -> ()
    let content: () -> Content
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(demographicQuestion.title)
                .font(Font.system24)
                .multilineTextAlignment(.center)
            
            content()
            
            Button("Submit") {
                buttonPressed()
            }.buttonStyle(RoundedButtonStyle())
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    DemographicQuestionView(
        demographicQuestion: .educationBackground,
        buttonPressed: {}
    ) {
        TextField("", text: .constant("hello"))
    }
}
