//
//  OnboardingView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 17.01.25.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("We ask for some demographic information to better analyze survey responses.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.top, 30)
            
            Text("Your responses will remain confidential, securely stored, and used only for research purposes.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.top, 10)

            Image(systemName: "lock.shield")
                .font(.system(size: 150))
                .foregroundColor(Color.mainBlue)
                .padding(.vertical, 40)
                .padding(.bottom, 30)
      
            Button("Get Started") {
                coordinator.pushNext(to: .onboarding)
            }
            .buttonStyle(RoundedButtonStyle())
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    OnboardingView()
}
