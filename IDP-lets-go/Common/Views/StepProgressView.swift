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
            Rectangle()
                .fill(Color.black.opacity(0.2))
                .cornerRadius(10)
                .frame(width: max(0, geometry.size.width - 32),
                       height: geometry.size.height)
                .animation(.easeInOut, value: currentStep)
                .overlay(content: {
                    HStack {
                        Rectangle()
                            .fill(Color.mainBlue)
                            .cornerRadius(10)
                            .frame(
                                width: max(
                                    0, (geometry.size.width - 32) * CGFloat(currentStep + 1) / CGFloat(totalSteps + 1)),
                                height: geometry.size.height
                            )
                            .animation(.easeInOut, value: currentStep)
                        Spacer()
                    }
                })
                .padding(.horizontal, 16)
                
        }
    }
}

#Preview {
    StepProgressView(currentStep: 3, totalSteps: 5)
        .frame(height: 30)
}
