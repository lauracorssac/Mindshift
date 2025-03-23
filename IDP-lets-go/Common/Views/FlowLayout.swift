//
//  FlowView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.03.25.
//

import SwiftUI

struct FlowLayout<Content: View>: View {
    let items: [String]
    let spacing: CGFloat
    let itemHorizontalPadding: CGFloat
    let content: (String) -> Content
    
    var body: some View {
       
        let rows = self.createRows(in: UIScreen.main.bounds.width - 10)
        ScrollView {
            VStack(alignment: .center, spacing: 5) {
                ForEach(rows, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { item in
                            content(item)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .clipped()
    }
    
    private func createRows(in availableWidth: CGFloat) -> [[String]] {
        var width: CGFloat = 0
        var rows: [[String]] = [[]]

        for item in items {
            let itemWidth = textSize(item).width + itemHorizontalPadding*2 + 5
            if width + itemWidth > availableWidth {
                rows.append([])
                width = 0
            }
            rows[rows.count - 1].append(item)
            width += itemWidth + spacing
        }

        return rows
    }

    private func textSize(_ text: String) -> CGSize {
        let font = UIFont.systemFont(ofSize: 18)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size
    }
}
