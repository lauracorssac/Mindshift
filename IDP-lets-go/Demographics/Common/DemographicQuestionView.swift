//
//  DemographicQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum DemographicQuestion {
    
    case race, birthdate, gender, educationBackground, mmock, profession
    
    func title() -> String {
        switch self {
            
        case .race:
            "With which race do you identify yourself?"
        case .birthdate:
            "What's your birthdate?"
        case .gender:
            "What's your gender?"
        case .educationBackground:
            "What's your highest education background?"
        case .mmock:
            "What's your name?"
        case .profession:
            "What's your profession?"
        }
    }
}

struct DemographicQuestionView<Content: View>: View {
    
    let demographicQuestion: DemographicQuestion
    let buttonPressed: () -> ()
    let content: () -> Content
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
            
            Spacer()
            Text(demographicQuestion.title())
                .font(Font.system24)
                .multilineTextAlignment(.center)
            
            content()
            
            Spacer()
            
        }
        .padding(.vertical, 14)
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
