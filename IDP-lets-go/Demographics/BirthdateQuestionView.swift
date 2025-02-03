//
//  BirthdateQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct BirthdateQuestionView: View {
    
    @Binding var birthDate: Date
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .birthdate,
            buttonPressed: {}
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
    BirthdateQuestionView(birthDate: .constant(Date.now))
        .environmentObject(AppCoordinator())
}
