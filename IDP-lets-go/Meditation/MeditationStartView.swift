//
//  MeditationStartView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 05.12.24.
//

import SwiftUI

struct MeditationStartView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("You’ve completed the diagnostic phase and are now ready to begin the mindfulness exercises.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 20)
                
                NavigationLink(destination: MeditationAudioView()) {
                    Text("Begin Exercise")
                        .padding(12)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(100)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    MeditationStartView()
}
