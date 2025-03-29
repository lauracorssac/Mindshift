//
//  ScoreManager.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 11.03.25.
//
import Foundation

class ScoreManager {
    static let shared = ScoreManager()
    private(set) var allTrials: [Trial] = []
    
    private init() {}
    
    func addTrials(_ newTrials: [Trial]) {
        allTrials.append(contentsOf: newTrials)
        print("Accumulated trials count: \(allTrials.count)")
    }
    func computeAndAssignScore() {
        let scoreModel = ScoreModel(trials: allTrials)
        let computedScore = scoreModel.score
        UserModel.shared.user.score = computedScore
        UserModel.shared.user.trials = Set(allTrials)
        
        print("Assigned final score \(computedScore ?? 0) for user")
            
    }
    //TODO: Need to reset trials if we make the user solve IAT again
    func resetTrials() {
        allTrials.removeAll()
    }
}

