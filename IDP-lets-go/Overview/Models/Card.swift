//
//  Card.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 25.12.24.
//

struct Card: Hashable {
    let title: String
    let subtitle: String
    let imageName: String
    
    static let mock = Card(
        title: "Step 1",
        subtitle: "Step 1 Description Step 1 Description Step 1Description Step 1DescriptionStep 1DescriptionStep 1Description Step 1 Description Step 1 Description",
        imageName: "step1"
    )
}
