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
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.top, 30)
            
            Text(MeditationStrings.EndView.sessionCompleteMessage)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.top, 10)
            
            Image(systemName: "checkmark.circle")
                .font(.system(size: 150))
                .foregroundColor(Color.mainBlue)
                .padding(.vertical, 40)
                .padding(.bottom, 30)
            
            HStack {
                Button("Proceed to test") {
                    coordinator.pushNext(to: .meditationEnd)
                }
                .buttonStyle(RoundedButtonStyle(fixedWidth: 158))
                Button("Restart meditation") {
                    coordinator.pushNext(to: .clouds)
                }
                .buttonStyle(RoundedButtonStyle(fixedWidth: 158))
            }
            .padding(.bottom, 30)
            .padding(.leading, 25)
            .padding(.trailing, 25)
        }
    }
}

#Preview {
    MeditationEndView()
}
