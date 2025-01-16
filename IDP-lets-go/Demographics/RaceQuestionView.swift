//
//  NameQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct RaceQuestionView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var race: String = ""
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .race,
            buttonPressed: {
                coordinator.pushNext(to: .race)
            }
        ) {
            TextField("Your race", text: $race)
        }
    }
}

#Preview {
    RaceQuestionView()
        .environmentObject(AppCoordinator())
}
