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
        HStack(spacing: 5) {
            ForEach(0..<numberOfCards, id: \.self) { index in
                Button {
                    withAnimation {
                        selectedIndex = index
                    }
                } label: {
                    
                    Circle()
                        .foregroundStyle(selectedIndex == index ? Color.mainBlue : .white)
                        .overlay(
                            Circle()
                                .stroke(Color.mainBlue, lineWidth: 1)
                        )
                        .frame(width: 10, height: 10)
                }
            }
        }
    }
}

#Preview {
    OverviewPageControlView(numberOfCards: 5, selectedIndex: .constant(3))
}
