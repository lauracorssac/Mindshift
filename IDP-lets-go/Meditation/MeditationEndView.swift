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
            Text(MeditationStrings.EndView.sessionCompleteTitle)
                .font(.largeTitle)
                .padding()
            Text(MeditationStrings.EndView.sessionCompleteMessage)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.vertical, 20)
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 150))
                .foregroundColor(Color.mainBlue)
                .padding(.vertical, 50)
            HStack {
                Spacer()
                Button("Proceed to test") {
                    coordinator.pushNext(to: .meditationEnd)
                }
                .buttonStyle(RoundedButtonStyle())
                Spacer()
                Button("Restart meditation") {
                    coordinator.pushNext(to: .clouds)
                }
                .buttonStyle(RoundedButtonStyle())
                Spacer()
            }
        }
    }
}

#Preview {
    MeditationEndView()
}
