//
//  DemographicQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct DemographicQuestion {
    let title: String
    
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
        demographicQuestion: .mock,
        buttonPressed: {}
    ) {
        TextField("", text: .constant("hello"))
    }
}
