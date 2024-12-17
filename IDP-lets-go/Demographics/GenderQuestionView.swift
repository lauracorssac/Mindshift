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

struct GenderQuestionView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var gender: Gender = .none
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .gender,
            buttonPressed: { 
                coordinator.pushNext(to: .gender)
            }
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
    GenderQuestionView()
        .environmentObject(AppCoordinator())
}
