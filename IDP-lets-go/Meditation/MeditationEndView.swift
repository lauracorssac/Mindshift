//
//  MeditationEndView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 06.12.24.
//

import SwiftUI

struct MeditationEndView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("Session complete!")
                .font(.largeTitle)
                .padding()
            Text("You have completed the mindfulness exercise. Keep it up!")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.vertical, 20)
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 150))
                .foregroundColor(.blue)
            
            Button("Go to test") {
                coordinator.pushNext(to: .meditationEnd)
            }
            .buttonStyle(RoundedButtonStyle())
        }
    }
}

#Preview {
    MeditationEndView()
}
