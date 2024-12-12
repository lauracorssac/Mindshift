//
//  AudioPlayerViewModel.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 05.12.24.
//

import SwiftUI
import AVFoundation

class AudioPlayerViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    private var player: AVAudioPlayer?
    
    @Published var progress: Double = 0.0
    @Published var isPlaying: Bool = false
    @Published var audioFinished: Bool = false
    
    // Properties to show the current time and total duration underneath the progress bar
    var formattedCurrentTime: String {
        guard let player = player else { return "0:00" }
        return formatTime(player.currentTime)
    }
    
    var formattedDuration: String {
        guard let player = player else { return "0:00" }
        return formatTime(player.duration)
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    func setupPlayer() {
        guard let url = Bundle.main.url(forResource: "meditation_audio", withExtension: "mp3") else {
            print("Audio file not found.")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
        } catch {
            print("Failed to initialize player: \(error)")
        }
    }
    
    func playPause() {
        guard let player = player else { return }
        
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        
        isPlaying.toggle()
        
        if isPlaying {
            startUpdatingProgress()
        }
    }
    
    private func startUpdatingProgress() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            self?.updateProgress()
        }
    }
    
    private func updateProgress() {
        guard let player = player else { return }
        let currentTime = player.currentTime
        let duration = player.duration
        let progress = currentTime / duration
        self.progress = min(max(progress, 0), 1)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.audioFinished = true
        }
    }
}
