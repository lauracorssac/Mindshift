//
//  ProfessionQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.12.24.
//

import SwiftUI

struct ProfessionQuestionView: View {
   
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var profesison = ""
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .profession,
            buttonPressed: {
                coordinator.pushNext(to: .profession)
            }
        ) {
            TextField("Your profession", text: $profesison)
        }
    }
}

#Preview {
    ProfessionQuestionView()
}
