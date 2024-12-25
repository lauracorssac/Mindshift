//
//  OverviewView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 25.12.24.
//

import SwiftUI



struct Card: Hashable, Identifiable {
    var id = UUID()
    let text: String
}

struct OverviewPageView: View {
    
    @State private var selectedIndex: Int? = 0
    
    let cards = [
        Card(text: "hello"),
        Card(text: "world")
    ]
      
      var body: some View {
          VStack {
              ScrollView(.horizontal) {
                  HStack {
                      ForEach(0..<cards.count, id: \.self) { cardIndex in
                          OverviewCardView(card: cards[cardIndex])
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
              
              OverviewPageControlView(
                numberOfCards: cards.count,
                selectedIndex: $selectedIndex
              )
          }
      }
}

#Preview {
    OverviewPageView()
}
