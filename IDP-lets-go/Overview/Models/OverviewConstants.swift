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
            subtitle: "You will begin by engaging in a mindfulness exercise in the form of a meditation, designed to enhance awareness and reduce unconscious biases.",
            imageName: "step1"
        ),
        Card(
            title: "Test phase",
            subtitle: "Next, you will take a small game called implicit association test to measure your unconscious biases. Detailed information about how it works will be provided.",
            systemImageName: "stopwatch"
        ),
        Card(
            title: "Questions phase",
            subtitle: "Finally, you will answer to a questionary to evaluate that measures your unconscious biases in a different way.",
            imageName: "step3"
        )
    ]
    
    let controlCards = [
        Card(
            title: "Test phase",
            subtitle: "You will begin taking a small game called implicit association test to measure your unconscious biases. Detailed information about how the test works will be provided.",
            systemImageName: "stopwatch"
        ),
        Card(
            title: "Questions phase",
            subtitle: "Next, you will answer to a questionary to evaluate that measures your unconscious biases in a different way.",
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
