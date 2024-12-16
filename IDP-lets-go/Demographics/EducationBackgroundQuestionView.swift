//
//  EducationBackgroundQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum EducationBackground: String, CaseIterable, Identifiable {
    var id: String {
        return self.rawValue
    }
    
    case highSchool = "High School"
    case bachelors = "Bachelors"
    case masters = "Masters"
    case phd = "PhD"
    case none = "None"
}

struct EducationBackgroundQuestionView<T: Coordinator>: View {
    
    @EnvironmentObject private var coordinator: T
    @State private var education: EducationBackground = .none
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .educationBackground,
            buttonPressed: { }
        ) {
            Picker("Education", selection: $education) {
                ForEach(EducationBackground.allCases) { education in
                    Text(education.rawValue)
                        .tag(education)
                }
            }
        }
    }
}

#Preview {
    EducationBackgroundQuestionView<MockCoordinator>()
        .environmentObject(MockCoordinator())
}
