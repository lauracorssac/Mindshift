//
//  DemographicsWrapperView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 02.02.25.
//

import SwiftUI

struct DemographicsWrapperView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var currentStep: Int = 0
    @State private var currentProgress: Int = 1
    @ObservedObject var viewModel: DemographicsViewModel
    
    var totalSteps: Int {
        viewModel.questions.count
    }
    
    var body: some View {
        
        
            
            VStack(spacing: 0) {
                
                StepProgressView(
                    currentStep: currentProgress,
                    totalSteps: totalSteps + 1
                )
                .frame(height: 30)
                .padding(.vertical, 16)
                
                Spacer()
                
                
                buildMiddleView(for: viewModel.questions[currentStep])
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)
                    ))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                
                
                Spacer()
                
            
                Button("Submit") {
                    buttonPressed()
                }.buttonStyle(
                    RoundedButtonStyle(
                        isDisabled: viewModel.isButtonDisabled(for: currentStep)
                    )
                )
                .padding(.bottom, 16)
                .disabled(viewModel.isButtonDisabled(for: currentStep))
        }
        
        
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Button(action: {
                    currentStep -= 1
                    currentProgress -= 1
                }, label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.mainBlue)
                }).opacity(currentStep == 0 ? 0 : 1)
            })
        }
        .onChange(of: viewModel.shouldPresentNextView) { _, present in
            if present {
                coordinator.pushNext(to: .demographics)
            }
        }
    }
    
    private func buttonPressed() {
        
        if currentStep + 1 < totalSteps {
            withAnimation(Animation.easeInOut, {
                currentProgress += 1
                currentStep += 1
            })
        } else {
            withAnimation(Animation.spring(dampingFraction: 0.1), {
                currentProgress += 1
            })
            
            viewModel.saveData()
        }
    
    }
    
    @ViewBuilder
    private func buildMiddleView(for step: DemographicQuestion) -> some View {
        
        switch(step) {
            
        case .birthdate:
            StringPickerView(
                value: $viewModel.birthYear,
                demographicQuestion: .birthdate
            )
            .pickerStyle(WheelPickerStyle())
            
        case .race:
            
            SelectionView(
                values: $viewModel.races,
                demographicQuestion: .race
            )
            
            
        case .gender:
            StringPickerView(
                value: $viewModel.gender,
                demographicQuestion: step
            )
            
        case .profession:
            SelectionView(
                values: $viewModel.professions,
                demographicQuestion: .profession
            )
            
        case .educationBackground:
            StringPickerView(
                value: $viewModel.education,
                demographicQuestion: step
            )
        case .mmock:
            Text("Mock")
            
        }
        
    }
}



#Preview {
    NavigationStack {
        DemographicsWrapperView(viewModel: .init())
            .environmentObject(AppCoordinator())
    }
}
