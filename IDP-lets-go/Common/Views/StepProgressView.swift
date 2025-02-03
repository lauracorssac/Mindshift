//
//  ProgressView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 02.02.25.
//

import SwiftUI

struct StepProgressView: View {
    
    let currentStep: Int
    let totalSteps: Int
    
    var body: some View {
        GeometryReader { geometry in
            
            let aa: CGFloat = (geometry.size.width - 32) / CGFloat(totalSteps)
            
            ZStack {
                Rectangle()
                    .fill(Color.black.opacity(0.2))
                    .cornerRadius(10)
                    .animation(.easeInOut, value: currentStep)
                    .padding(.horizontal, 16)
                
               
                Rectangle()
                    .fill(Color.mainBlue)
                    .cornerRadius(10)
                    .padding(.leading, 16)
                    .padding(.trailing, 16 + CGFloat((totalSteps - currentStep)) * aa)
                    .animation(.easeInOut, value: currentStep)
                
            }
                
        }
    }
}

#Preview {
    VStack {
        StepProgressView(currentStep: 1, totalSteps: 5)
            .frame(height: 30)
        
        StepProgressView(currentStep: 2, totalSteps: 5)
            .frame(height: 30)
        
        StepProgressView(currentStep: 3, totalSteps: 5)
            .frame(height: 30)
        
        StepProgressView(currentStep: 4, totalSteps: 5)
            .frame(height: 30)
        
        StepProgressView(currentStep: 5, totalSteps: 5)
            .frame(height: 30)
    }
}
