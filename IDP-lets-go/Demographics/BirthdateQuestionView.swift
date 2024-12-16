//
//  BirthdateQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct BirthdateQuestionView<T : Coordinator>: View {
    
    @EnvironmentObject private var coordinator: T
    @State private var birthDate = Date.now
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .birthdate,
            buttonPressed: { 
                
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
    BirthdateQuestionView<MockCoordinator>()
        .environmentObject(MockCoordinator())
}
