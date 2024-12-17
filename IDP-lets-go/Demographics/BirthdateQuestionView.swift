//
//  BirthdateQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct BirthdateQuestionView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var birthDate = Date.now
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .birthdate,
            buttonPressed: { 
                coordinator.pushNext(to: .birthdate)
            }
        ) {
            DatePicker(
                selection: $birthDate,
                in: ...Date.now, displayedComponents: .date
            ) {
                Text("")
            }
            .datePickerStyle(.graphical)
        }
    }
}

#Preview {
    BirthdateQuestionView()
        .environmentObject(AppCoordinator())
}
