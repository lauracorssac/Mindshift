//
//  NameQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct RaceQuestionView: View {
    
    @Binding var race: String
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .race,
            buttonPressed: {}
        ) {
            TextField("Your race", text: $race)
        }
    }
}

#Preview {
    RaceQuestionView(race: .constant(""))
        .environmentObject(AppCoordinator())
}
