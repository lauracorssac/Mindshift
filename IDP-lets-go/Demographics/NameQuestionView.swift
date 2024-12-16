//
//  NameQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct NameQuestionView<T: Coordinator>: View {
    
    @EnvironmentObject private var coordinator: T
    @State private var name: String = ""
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .name,
            buttonPressed: { }
        ) {
            TextField("Your name", text: $name)
        }
    }
}

#Preview {
    NameQuestionView<MockCoordinator>()
        .environmentObject(MockCoordinator())
}
