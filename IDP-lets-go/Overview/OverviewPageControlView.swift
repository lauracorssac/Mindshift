//
//  OverviewPageControlView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 25.12.24.
//

import SwiftUI

struct OverviewPageControlView: View {
    
    let numberOfCards: Int
    @Binding var selectedIndex: Int?
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfCards, id: \.self) { index in
                Button {
                    withAnimation {
                        selectedIndex = index
                    }
                } label: {
                    Image(
                        systemName: selectedIndex == index ? "circle.fill" : "circle"
                    )
                    .foregroundStyle(Color(uiColor: .systemGray3))
                }
            }
        }
    }
}

#Preview {
    OverviewPageControlView(numberOfCards: 5, selectedIndex: .constant(3))
}
