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
            
            VStack {
                Spacer()
                if !card.systemImageName.isEmpty {
                    Image(systemName: card.systemImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .bold()
                } else {
                    Image(card.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                }
            }
            .padding(.bottom, 40)
            
            VStack(spacing: 0) {
                Text(card.title)
                    .font(Font.system18Bold)
                Text(card.subtitle)
                    .padding(.top, 15)
                    .font(Font.system16)
                Spacer()
            }
            .padding(.top, 0)
            
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
    OverviewCardView(card: Card.step1Mock)
}

#Preview {
    OverviewCardView(card: Card.step2Mock)
}

#Preview {
    OverviewCardView(card: Card.step3Mock)
}
