//
//  DemographicsFinalView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 24.01.25.
//

import SwiftUI

struct DemographicsFinalView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("Thank you for sharing your information!")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.top, 30)
            
            Text("Your input helps us create better insights and ensures the study is meaningful.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.top, 10)
            
            Image(systemName: "checkmark.shield")
                .font(.system(size: 150))
                .foregroundColor(Color.mainBlue)
                .padding(.vertical, 50)
                .padding(.bottom, 30)

            Button("Continue") {
                coordinator.pushNext(to: .demographicsFinal)
            }
            .buttonStyle(RoundedButtonStyle())
            .padding(.bottom, 30)
        }
        .padding(.horizontal)
    }
}

#Preview {
    DemographicsFinalView()
}
