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
                UserModel.user.race = race
                // TODO: move this from view
                Task {
                    let result = await Requests.shared.saveUser()
                    switch result {
                    case .success:
                        coordinator.pushNext(to: .race)
                    case .error:
                        // TODO: treat
                        print("error saving data")
                    }
                }
                
                
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
