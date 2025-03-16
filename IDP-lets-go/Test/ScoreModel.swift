//
//  ScoreModel.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 11.03.25.
//
import Foundation

struct Trial {
    let step: Int
    let responseTime: Int
}

class ScoreModel{
    var trials: [Trial]
    
    init(trials: [Trial]) {
        self.trials = trials
    }
    
    var score: Double? {
        return computeScore()
    }
    private func computeScore() -> Double? {
        // Steps from table
        //Step 1
        print("All recorded trials:")
        for trial in ScoreManager.shared.allTrials {
            print("Step: \(trial.step), Response time: \(trial.responseTime) ms")
        }
        
        let validTrials = trials.filter { $0.responseTime <= 10000 }
        print("Valid trials count: \(validTrials.count)")
        guard !validTrials.isEmpty else { return nil }
        
        //Step 2
        let fastTrialsCount = validTrials.filter { $0.responseTime < 300 }.count
        let fastTrialsRatio = Double(fastTrialsCount) / Double(validTrials.count)
        print("Fast trials ratio: \(fastTrialsRatio)")
        if fastTrialsRatio > 0.10 {
            return nil
        }
        
        // Step 3
        let stage3 = validTrials.filter { $0.step == 3 }.map { Double($0.responseTime) }
        let stage6 = validTrials.filter { $0.step == 6 }.map { Double($0.responseTime) }
        let stage4 = validTrials.filter { $0.step == 4 }.map { Double($0.responseTime) }
        let stage7 = validTrials.filter { $0.step == 7 }.map { Double($0.responseTime) }
        
        print("Stage3 count: \(stage3.count), Stage6 count: \(stage6.count)")
        print("Stage4 count: \(stage4.count), Stage7 count: \(stage7.count)")
        
        guard !stage3.isEmpty, !stage6.isEmpty, !stage4.isEmpty, !stage7.isEmpty else {
            return nil
        }
        
        func mean(of values: [Double]) -> Double {
            return values.reduce(0, +) / Double(values.count)
        }
        
        func standardDeviation(of values: [Double]) -> Double {
            guard values.count > 1 else { return 0.0 }
            let avg = mean(of: values)
            let variance = values.map { pow($0 - avg, 2) }.reduce(0, +) / Double(values.count - 1)
            return sqrt(variance)
        }
        
        // Compute inclusive SD for combined stages:
        // For stages 3 & 6:
        let stage3and6 = stage3 + stage6
        // For stages 4 & 7:
        let stage4and7 = stage4 + stage7
        
        guard stage3and6.count > 1, stage4and7.count > 1 else { return nil }
        
        let sd3and6 = standardDeviation(of: stage3and6)
        let sd4and7 = standardDeviation(of: stage4and7)
        if sd3and6 == 0 || sd4and7 == 0 {
            return nil
        }
        
        // Step 4
        // Compute means for each stage:
        let mean3 = mean(of: stage3)
        let mean6 = mean(of: stage6)
        let mean4 = mean(of: stage4)
        let mean7 = mean(of: stage7)
        
        // Step 5
        // Compute differences:
        let diff1 = mean6 - mean3
        let diff2 = mean7 - mean4
        
        // Step 6
        // Divide differences by the inclusive SDs
        let ratio1 = diff1 / sd3and6
        let ratio2 = diff2 / sd4and7
        
        // Step 7
        //Calculate the final D score as the average of the two ratios.
        let dScore = (ratio1 + ratio2) / 2
        return dScore
        
    }
    func classifyDScore() -> String? {
        guard let dScore = self.score else { return nil }
        let absScore = abs(dScore)
        switch absScore {
        case 0..<0.15:
            return "Little or no automatic association"
        case 0.15..<0.35:
            return "Slight automatic association"
        case 0.35..<0.65:
            return "Moderate automatic association"
        case 0.65...:
            return "Strong automatic association"
        default:
            return nil
        }
    }
}
