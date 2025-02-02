//
//  BirthdateQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct BirthdateQuestionView: View {
    
    let buttonPressed: () -> ()
    @State private var birthDate = Date.now
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .birthdate,
            buttonPressed: { 
                UserModel.user.birthdate = birthDate.toString()
                buttonPressed()
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
    BirthdateQuestionView(buttonPressed: {})
        .environmentObject(AppCoordinator())
}
