//
//  TestPartIndicatorView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//
import SwiftUI

struct TestPartIndicatorView: View {
    let step: Step
    let totalNumberOfSteps: Int
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 20) {
            Text("Part \(step.stepNumber)/\(totalNumberOfSteps)")
                            .font(.headline)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
            
            Text("""
                \(step.stepNumber == 4 || step.stepNumber == 6
                    ? "This part is the same as the previous part. "
                    : "")\
                Click left button for \(step.leftTitle). Click right button for \(step.rightTitle). Items will appear one at a time. If you make a mistake, click the right answer to continue. Go fast as you can while being accurate.
                """)
                .multilineTextAlignment(.center)
                           .font(.subheadline)
                           .foregroundColor(.gray)
                           .padding(.horizontal)
        
            Button("Continue") {
                coordinator.pushNext(to: .testStepIntro(step: step, total: totalNumberOfSteps))
            }.buttonStyle(RoundedButtonStyle())
           
        }.padding()
    }
}

#Preview {
    TestPartIndicatorView(step: Step.mockStep1, totalNumberOfSteps: 7)
        .environmentObject(AppCoordinator())
}

