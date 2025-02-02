//
//  DemographicsWrapperView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 02.02.25.
//

import SwiftUI

struct DemographicsWrapperView: View {
    
    let questions: [DemographicQuestion] = [.gender, .birthdate, .race,.educationBackground, .profession]
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var currentStep: Int = 0
    
    var totalSteps: Int {
        questions.count
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            StepProgressView(
                currentStep: currentStep,
                totalSteps: totalSteps
            )
            .frame(height: 30)
            .padding(.top, 16)
            
            Spacer()
            
            buildMiddleView(for: questions[currentStep])
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .leading)
                ))
            
        }
    }
        
    
    
    private func buttonPressed() {
        withAnimation(Animation.easeInOut, {
            if currentStep + 1 < totalSteps {
                currentStep += 1
            } else {
                coordinator.pushNext(to: .demographics)
            }
        })
        
    }
    
    @ViewBuilder
    private func buildMiddleView(for step: DemographicQuestion) -> some View {
        
        switch(step) {
            
        
        case .birthdate:
            BirthdateQuestionView(buttonPressed: buttonPressed)
            
        case .race:
            RaceQuestionView(buttonPressed: buttonPressed)
            
        case .gender:
            GenderQuestionView(buttonPressed: buttonPressed)
            
        case .profession:
                ProfessionQuestionView(buttonPressed: buttonPressed)
            
        case .educationBackground:
                EducationQuestionView(buttonPressed: buttonPressed)
        case .mmock:
            Text("Mock")
            
        }
        
    }
}

#Preview {
    DemographicsWrapperView()
        .environmentObject(AppCoordinator())
}
