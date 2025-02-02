//
//  ProfessionQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.12.24.
//

import SwiftUI

struct ProfessionQuestionView: View {
   
    @State private var profesison = ""
    let buttonPressed: () -> ()
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .profession,
            buttonPressed: {
                UserModel.user.profession = profesison
                buttonPressed()
            }
        ) {
            TextField("Your profession", text: $profesison)
        }
    }
}

#Preview {
    ProfessionQuestionView(buttonPressed: {})
}
