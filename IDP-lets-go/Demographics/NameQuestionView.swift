//
//  NameQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct NameQuestionView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var name: String = ""
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .name,
            buttonPressed: {
                coordinator.pushNext(to: .name)
            }
        ) {
            TextField("Your name", text: $name)
        }
    }
}

#Preview {
    NameQuestionView()
        .environmentObject(AppCoordinator())
}
