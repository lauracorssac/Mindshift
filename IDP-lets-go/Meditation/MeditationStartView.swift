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
            Text("You’ve completed the diagnostic phase and are now ready to begin the mindfulness exercises.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.vertical, 20)
            
            Button("Begin Exercise") {
                coordinator.pushNext(to: .meditationStart)
            }.buttonStyle(RoundedButtonStyle())
            
            Spacer()
        }
        
    }
}

#Preview {
    MeditationStartView()
        .environmentObject(AppCoordinator())
}
