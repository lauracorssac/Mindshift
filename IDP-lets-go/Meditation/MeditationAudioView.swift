//
//  MeditationAudioView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 05.12.24.
//
import SwiftUI

struct MeditationAudioView: View {
    @StateObject private var viewModel = AudioPlayerViewModel()
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            
            Button(action: {
                viewModel.playPause()
            }) {
                Image(systemName: viewModel.isPlaying ? "pause.circle" : "play.circle")
                    .font(.system(size: 85))
                    .foregroundColor(Color.mainBlue)
                    .padding(.vertical, 20)
            }
            
            
            ProgressView(value: viewModel.progress, total: 1.0)
                .progressViewStyle(
                    LinearGaugeProgressStyle()
                )
                .frame(height: 20)
                .padding(.horizontal, 25)
            
            
            HStack {
                Text(viewModel.formattedCurrentTime)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Text(viewModel.formattedDuration)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 25)
            
        }
        .gradientBackground()
        .onChange(of: viewModel.audioFinished) { _, isFinished in
            if isFinished {
                UserModel.shared.user.meditationSessions += 1
                coordinator.pushNext(to: .meditation)
                UIApplication.shared.isIdleTimerDisabled = false
            }
        }
        .onAppear {
            viewModel.setupPlayer()
        }
    }
}

#Preview {
    MeditationAudioView()
}

// Custom Progress Bar
private struct LinearGaugeProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background capsule (full width)
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: geometry.size.height)
                
                // Foreground capsule (progress width)
                Capsule()
                    .fill(Color.mainBlue)
                    .frame(
                        width: max(CGFloat(fractionCompleted) * geometry.size.width, geometry.size.height),
                        height: geometry.size.height
                    )
            }
        }
    }
}
