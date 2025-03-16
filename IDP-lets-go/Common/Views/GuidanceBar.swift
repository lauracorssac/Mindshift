//
//  GuidanceBar.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 11.02.25.
//
import SwiftUI

struct GuidanceBar: View {
    var highlightedIndex: Int?
    var highlightColor: Color = .cyan
    let group: Group
    
    private var steps: [Int] {
        if group == .control {
            return [1,2]
        }
        return [0,1,2]
    }
    
    private func icon(for index: Int) -> Image {
        switch index {
        case 0: return Image("step1")
        case 1: return Image(systemName: "stopwatch")
        case 2: return Image("step3")
        default: return Image("")
        }
    }
    
    var body: some View {
        HStack(spacing: 40) {
            ForEach(steps, id: \.self) { index in
                icon(for: index)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(index == highlightedIndex ? highlightColor : .black)
                    .bold()
            }
        }
    }
}

#Preview {
    GuidanceBar(highlightedIndex: 1, group: .control)
    GuidanceBar(highlightedIndex: 2, group: .control)
    GuidanceBar(highlightedIndex: 0, group: .target)
    GuidanceBar(highlightedIndex: 1, group: .target)
    GuidanceBar(highlightedIndex: 2, group: .target)
}

