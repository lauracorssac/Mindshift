//
//  OverviewCardView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 25.12.24.
//

import SwiftUI

struct OverviewCardView: View {
    
    let card: Card
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Image(card.imageName)
            Text(card.title)
                .padding(.top, 50)
                .font(Font.system24)
            Text(card.subtitle)
                .padding(.top, 15)
                .font(Font.system18)
        }
        .padding(.horizontal, 16)
        .multilineTextAlignment(.center)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(.background)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.mainBlue, lineWidth: 3)
        )
    }
}

#Preview {
    OverviewCardView(card: Card.mock)
}
