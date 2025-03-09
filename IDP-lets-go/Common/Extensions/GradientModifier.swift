//
//  GradientModifier.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 08.03.25.
//

import SwiftUI

struct GradientModifier: ViewModifier {
    
    
    let velocity: Double = 2 // The higher, the slower is the transition
    let opacityUpperbound: Double = 0.7
    let opacityLowerbound: Double = 0.3
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            if #available(iOS 18.0, *) {
                TimelineView(.animation) { timeline in
                    
                    let opacity = getOpacity(date: timeline.date)
                    
                    MeshGradient(width: 3, height: 3, points: [
                        [0, 0], [0.5, 0], [1, 0],
                        [0, 0.5], [0.5, 0.5], [1, 0.5],
                        [0, 1], [0.5, 1], [1, 1]
                    ], colors: [
                        .mainBlue.opacity(opacity), .mainBlue.opacity(opacity), .mainBlue.opacity(opacity),
                        .mint.opacity(opacity), .mint.opacity(opacity), .mint.opacity(opacity),
                        .green.opacity(0.3), .green.opacity(0.3), .green.opacity(0.3)
                    ])
                    .ignoresSafeArea()
                    
                }
            }
            else {
                
                LinearGradient(
                    gradient: Gradient(colors: [.mainBlue.opacity(0.5), .green.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            }
            
            content
        }
    }
    
    func getOpacity(date: Date) -> Double {
        let sin =  sin(date.timeIntervalSince1970 / velocity)
        let positive01sin = (sin + 1) / 2.0
        let customRangeSin = positive01sin * opacityUpperbound - opacityLowerbound + opacityLowerbound
        return customRangeSin
    }
}

extension View {
    
    func gradientBackground() -> some View {
        modifier(GradientModifier())
    }
}

#Preview {
    Text("hello")
        .gradientBackground()
}
