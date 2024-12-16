//
//  GenderQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum Gender: String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case male, female, other, none
}

struct GenderQuestionView<T: Coordinator>: View {
    @EnvironmentObject private var coordinator: T
    @State private var gender: Gender = .none
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .gender,
            buttonPressed: { }
        ) {
            Picker("Gender", selection: $gender) {
                ForEach(Gender.allCases) { gender in
                    Text(gender.rawValue)
                        .tag(gender)
                }
            }
        }
    }
}

#Preview {
    GenderQuestionView<MockCoordinator>()
}
