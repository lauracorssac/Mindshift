//
//  ScoreManager.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 11.03.25.
//
import Foundation

class ScoreManager {
    static let shared = ScoreManager()
    private(set) var users: [User] = []
    private(set) var allTrials: [Trial] = []
    
    private init() {}
    
    func addUser(_ user: User) {
        if !users.contains(where: { $0.id == user.id }) {
            users.append(user)
            print("User added with id: \(user.id)")
        }
    }
    
    func addTrials(_ newTrials: [Trial]) {
        allTrials.append(contentsOf: newTrials)
        print("Accumulated trials count: \(allTrials.count)")
    }
    func computeAndAssignScore(for user: User) {
        let scoreModel = ScoreModel(trials: allTrials)
        if let computedScore = scoreModel.score {
            if let index = users.firstIndex(where: { $0.id == user.id }) {
                users[index].score = computedScore
                print("Assigned final score \(computedScore) for user with id \(user.id)")
            } else {
                print("User not found. Consider adding the user before assigning a score.")
            }
        } else {
            print("Test result could not be computed (invalid data).")
        }
    }
    //TODO: Need to reset trials if we make the user solve IAT again
    func resetTrials() {
        allTrials.removeAll()
    }
}

