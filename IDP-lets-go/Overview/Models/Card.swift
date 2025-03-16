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
    let systemImageName: String
    
    init(title: String, subtitle: String, imageName: String = "", systemImageName: String = "") {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.systemImageName = systemImageName
    }
    
    static let step1Mock = Card(
        title: "Step 1",
        subtitle: "Step 1 Description Step 1 Description Step 1Description Step 1DescriptionStep 1DescriptionStep 1Description Step 1 Description Step 1 Description",
        imageName: "step1"
    )
    
    static let step2Mock = Card(
        title: "Step 2",
        subtitle: "Step 1 Description Step 1 Description Step 1Description Step 1DescriptionStep 1DescriptionStep 1Description Step 1 Description Step 1 Description",
        systemImageName: "stopwatch"
    )
    
    static let step3Mock = Card(
        title: "Step 3",
        subtitle: "Step 1 Description Step 1 Description Step 1Description Step 1DescriptionStep 1DescriptionStep 1Description Step 1 Description Step 1 Description",
        imageName: "step3"
    )
}
