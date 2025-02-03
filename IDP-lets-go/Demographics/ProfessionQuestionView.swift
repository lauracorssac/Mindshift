//
//  ProfessionQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.12.24.
//

import SwiftUI

struct ProfessionQuestionView: View {
   
    @Binding var profesison: String
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .profession,
            buttonPressed: {}
        ) {
            TextField("Your profession", text: $profesison)
        }
    }
}

#Preview {
    ProfessionQuestionView(profesison: .constant(""))
}
