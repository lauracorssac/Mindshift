//
//  FlowView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.03.25.
//

import SwiftUI

struct FlowLayout<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let items: Data
    let spacing: CGFloat
    let content: (Data.Element) -> Content
    
    @State private var totalWidth: CGFloat = 0
    
    var body: some View {
       
        let rows = self.createRows(in: UIScreen.main.bounds.width - 10)
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
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
    
    private func createRows(in availableWidth: CGFloat) -> [[Data.Element]] {
        var width: CGFloat = 0
        var rows: [[Data.Element]] = [[]]

        for item in items {
            let itemWidth = textSize(item as! String).width + 30
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
