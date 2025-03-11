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
    
    private init() {}
    
    func addScore(for user: User, score: Double) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index].score = score
        }
    }
    
}

