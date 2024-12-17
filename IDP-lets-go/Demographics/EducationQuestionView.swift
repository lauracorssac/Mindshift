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

struct EducationQuestionView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var education: EducationBackground = .none
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .educationBackground,
            buttonPressed: {
                coordinator.pushNext(to: .education)
            }
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
    EducationQuestionView()
        .environmentObject(AppCoordinator())
}
