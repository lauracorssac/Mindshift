//
//  ProfessionPickerView.swift
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
        
        VStack(alignment: .center, spacing: 10) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { item in
                        content(item)
                    }
                }
            }
        }
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
        let font = UIFont.systemFont(ofSize: 17)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size
    }
}

struct ProfessionPickerView: View {
   
    @Binding var values: Set<String>
    let demographicQuestion: DemographicQuestion
    
    
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: demographicQuestion
        ) {
            FlowLayout(items: demographicQuestion.items().map { $0.0 }, spacing: 10) { interest in
                
                SelectableButton(title: interest, isSelected: values.contains(interest)) {
                    toggleSelection(of: interest)
                }
            }
         }
    }
    
    private func toggleSelection(of interest: String) {
        if values.contains(interest) {
            values.remove(interest)
        } else {
            values.insert(interest)
        }
    }
}

struct SelectableButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .padding(.horizontal, 15)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue.opacity(0.2) : Color.white)
                .foregroundColor(isSelected ? .blue : .black)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color.blue : Color.gray, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    ProfessionPickerView(
        values: .constant([""]),
        demographicQuestion: .profession
    )
}
