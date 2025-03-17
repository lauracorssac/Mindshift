//
//  ProfessionPickerView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.03.25.
//

import SwiftUI

struct SelectionView: View {
   
    @Binding var values: Set<String>
    let demographicQuestion: DemographicQuestion
    let buttonHorizontalPadding: CGFloat = 15
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: demographicQuestion
        ) {
            FlowLayout(
                items: demographicQuestion.items().map { $0.0 },
                
                spacing: 10,
                itemHorizontalPadding: buttonHorizontalPadding
            ) { interest in
                
                SelectableButton(
                    title: interest,
                    isSelected: values.contains(interest),
                    horizontalPadding: buttonHorizontalPadding) {
                    toggleSelection(of: interest)
                }
            }
         }
    }
    
    private func toggleSelection(of interest: String) {
        if values.contains(interest) {
            values.remove(interest)
        } else {
            values.insert(interest)
        }
    }
}

#Preview {
    SelectionView(
        values: .constant([""]),
        demographicQuestion: .profession
    )
}
