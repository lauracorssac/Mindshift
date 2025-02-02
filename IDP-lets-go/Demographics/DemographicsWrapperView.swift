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
        
        GeometryReader { geometry in
        VStack(spacing: 0) {
            
       
            Rectangle()
                .fill(Color.black.opacity(0.2))
                .cornerRadius(10)
                .frame(width: max(0, geometry.size.width - 32),
                       height: 30)
                .animation(.easeInOut, value: currentStep)
                .overlay(content: {
                    HStack {
                        Rectangle()
                            .fill(Color.mainBlue)
                            .cornerRadius(10)
                            .frame(
                                width: max(
                                    0, (geometry.size.width - 32) * CGFloat(currentStep + 1) / CGFloat(totalSteps + 1)),
                                height: 30
                            )
                            .animation(.easeInOut, value: currentStep)
                        Spacer()
                    }
                })
                
            .padding(.top, 16)
                
                Spacer()
    
                buildMiddleView(for: questions[currentStep])
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                
            }.padding(.horizontal, 16)
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
