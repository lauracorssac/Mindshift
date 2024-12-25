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
        
        Text(card.text)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(.background)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

#Preview {
    OverviewCardView(card: Card(text: "hello"))
}
