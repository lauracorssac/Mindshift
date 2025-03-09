//
//  OverviewView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 25.12.24.
//

import SwiftUI

struct OverviewPageView: View {
    
    let cards: [Card]
    
    private var cardsCount: Int {
        cards.count
    }
    
    @State private var selectedIndex: Int = 0
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            
            TabView(selection: $selectedIndex) {
                
                ForEach(0..<cardsCount, id: \.self) { cardIndex in
                    OverviewCardView(
                        card: cards[cardIndex]
                    )
                    .tag(cardIndex)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
                
               
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
           
            OverviewPageControlView(
                numberOfCards: cardsCount,
                selectedIndex: $selectedIndex
            )
            .padding(.top, 10)
            .padding(.bottom, 30)
           
            
            Spacer()
            
            Button(selectedIndex == cardsCount - 1 ? "Start" : "Next") {
                if selectedIndex == cardsCount - 1 {
                    coordinator.pushNext(to: .overview)
                } else {
                    withAnimation {
                        selectedIndex += 1
                    }
                }
            }
            .buttonStyle(RoundedButtonStyle(fixedWidth: 100))
            
            
        }
    }
}

#Preview {
    OverviewPageView(cards: Cards().getCards(userGroup: .control))
        .environmentObject(AppCoordinator())
}

#Preview {
    OverviewPageView(cards: Cards().getCards(userGroup: .target))
        .environmentObject(AppCoordinator())
}
