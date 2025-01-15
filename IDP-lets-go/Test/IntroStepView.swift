//
//  IntroStepView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 29.12.24.
//

import SwiftUI
struct TestStartView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("game start")
            Button("continue") {
                coordinator.pushNext(to: .testStart)
            }
        }
    }
}

struct IntroStepView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    let step: Step
    var body: some View {
        VStack {
            Text(step.introText)
            Button("continue") {
                coordinator.pushNext(to: .testStepIntro(step: step))
            }
        }
    }
}
