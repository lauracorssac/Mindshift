//
//  MeditationStartView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 05.12.24.
//

import SwiftUI

struct MeditationStartView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Spacer()
            Text(MeditationStrings.StartView.startMessage)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding()
            
            Button(MeditationStrings.StartView.buttonText) {
                coordinator.pushNext(to: .meditationStart)
            }.buttonStyle(RoundedButtonStyle())
                .padding()
            
            Spacer()
            GuidanceBar(
                highlightedIndex: 0,
                group: coordinator.group
            )
            .padding(.bottom, 30)
        }
        
    }
}

#Preview {
    MeditationStartView()
        .environmentObject(AppCoordinator())
}
