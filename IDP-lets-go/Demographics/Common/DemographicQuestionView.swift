//
//  DemographicQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct DemographicQuestionView<Content: View>: View {
    
    let demographicQuestion: DemographicQuestion
    let content: () -> Content
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
            
            Text(demographicQuestion.title())
                .font(Font.system24)
                .multilineTextAlignment(.center)
            
            content()
        
            
        }
        
    }
}

#Preview {
    DemographicQuestionView(
        demographicQuestion: .educationBackground
    ) {
        TextField("", text: .constant("hello"))
    }
}
