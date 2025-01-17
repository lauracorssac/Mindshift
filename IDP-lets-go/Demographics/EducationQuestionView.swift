//
//  EducationBackgroundQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum EducationBackground: String, CaseIterable, Identifiable, Codable {
    var id: String {
        return self.rawValue
    }
    
    case highSchool = "high_school"
    case bachelors = "bachelor"
    case masters = "master"
    case phd = "doctorate"
    case none = "none"
    
    func displayName() -> String {
        switch self {
        case .highSchool: return "High School"
        case .bachelors: return "Bachelors"
        case .masters: return "Masters"
        case .phd: return "PhD"
        case .none: return "None"
        }
    }
}

struct EducationQuestionView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var education: EducationBackground = .none
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .educationBackground,
            buttonPressed: {
                UserModel.user.education = education
                coordinator.pushNext(to: .education)
            }
        ) {
            Picker("Education", selection: $education) {
                ForEach(EducationBackground.allCases) { education in
                    Text(education.displayName())
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
