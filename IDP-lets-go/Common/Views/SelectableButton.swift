//
//  SelectableButtonType.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.03.25.
//

import SwiftUI

struct SelectableButton: View {
    let title: String
    let isSelected: Bool
    let horizontalPadding: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.system18)
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, 8)
                .background(isSelected ? Color.mainBlue.opacity(0.2) : Color.white)
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            Color.mainBlue,
                            lineWidth: 2
                        )
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}
