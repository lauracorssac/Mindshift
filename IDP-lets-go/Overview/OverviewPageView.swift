//
//  OverviewView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 25.12.24.
//

import SwiftUI

struct OverviewPageView: View {
    
    @State private var selectedIndex: Int? = 0
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: 0) {
            
            OverviewPageControlView(
                numberOfCards: OverviewConstants.allCards.count,
                selectedIndex: $selectedIndex
            )
            .padding(.top, 20)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<OverviewConstants.allCards.count, id: \.self) { cardIndex in
                        OverviewCardView(
                            card: OverviewConstants.allCards[cardIndex]
                        )
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .onAppear {
                            selectedIndex = cardIndex
                        }
                    }
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $selectedIndex)
            .scrollIndicators(.never)
            
            Button("Start") {
                coordinator.pushNext(to: .overview)
            }
            .opacity(
                (selectedIndex == OverviewConstants.allCards.count - 1) ? 1.0 : 0.0
            )
            .buttonStyle(RoundedButtonStyle())
            
            
        }
    }
}

#Preview {
    OverviewPageView()
        .environmentObject(AppCoordinator())
}
