//
//  OverviewConstants.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 25.12.24.
//

import Foundation

protocol CardsFactory {
    func getCards(userGroup: Group) -> [Card]
}

class Cards: CardsFactory {
    
    let targetCards = [
        Card(
            title: "Meditation phase",
            subtitle: "You will begin by engaging in a mindfulness exercise in the form of a meditation, designed to enhance awareness, helping you approach the next steps with a clear mind..",
            imageName: "step1"
        ),
        Card(
            title: "Test phase",
            subtitle: "Next, you will complete a quick interactive task that explores how you associate different concepts. Detailed information about how it works will be provided.",
            systemImageName: "stopwatch"
        ),
        Card(
            title: "Questions phase",
            subtitle: "Finally, you will answer a set of questions designed to encourage self-reflection and provide insights into your decision-making processes.",
            imageName: "step3"
        )
    ]
    
    let controlCards = [
        Card(
            title: "Test phase",
            subtitle: "You will begin by completing a quick interactive task that explores how you associate different concepts. Detailed information about how it works will be provided.",
            systemImageName: "stopwatch"
        ),
        Card(
            title: "Questions phase",
            subtitle: "Next, you will answer a set of questions designed to encourage self-reflection and provide insights into your decision-making processes.",
            imageName: "step3"
        )
    ]
    
    func getCards(userGroup group: Group) -> [Card] {
        if group == .control {
            return controlCards
        }
        return targetCards
    }
}
