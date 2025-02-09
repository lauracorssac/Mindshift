//
//  ProfessionQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.12.24.
//

import SwiftUI

import Foundation

struct StringPickerView: View {
   
    @Binding var value: String
    let demographicQuestion: DemographicQuestion
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: demographicQuestion
        ) {
            Picker(demographicQuestion.rawValue, 
                   selection: $value) {
                
                Text("Please Select").tag("")
                
                ForEach(demographicQuestion.items(),
                        id: \.self.1) { (item, id) in
                    Text(item).tag(id)
                }
            }
        }
    }
}

#Preview {
    StringPickerView(
        value: .constant(""),
        demographicQuestion: .gender
    )
}
