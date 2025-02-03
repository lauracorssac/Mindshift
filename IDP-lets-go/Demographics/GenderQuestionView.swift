//
//  GenderQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum Gender: String, CaseIterable, Identifiable, Codable {
    var id: String {
        self.rawValue
    }
    
    case male, female, other, none
}

struct GenderQuestionView: View {
   
    @Binding var gender: Gender
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .gender,
            buttonPressed: {}
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
    GenderQuestionView(gender: .constant(.none))
        .environmentObject(AppCoordinator())
}
