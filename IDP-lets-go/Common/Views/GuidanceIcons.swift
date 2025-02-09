//
//  GuidanceIcons.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 27.01.25.
//
import SwiftUI

struct GuidanceIcons: View {
    var highlightedIndex: Int?
    var highlightColor: Color = .cyan
    private func frameSize(for index: Int) -> CGSize {
        // Define frame sizes for each icon
        switch index {
        case 0: return CGSize(width: 41, height: 41)
        case 1: return CGSize(width: 50, height: 50)
        case 2: return CGSize(width: 45, height: 45)
        default: return CGSize(width: 50, height: 50)
        }
    }
    private func iconName(for index: Int) -> String {
        switch index {
        case 0: return "step1"
        case 1: return "step2"
        case 2: return "step3"
        default: return ""
            
        }
    }
    
    
    var body: some View {
        HStack(spacing: 40) {
            ForEach(0..<3, id: \.self) { index in
                Image(iconName(for: index))
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: frameSize(for: index).width, height: frameSize(for: index).height)
                    .foregroundColor(index == highlightedIndex ? highlightColor : .black)
            }
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    GuidanceIcons(highlightedIndex: 1)
}
