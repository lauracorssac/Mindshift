//
//  RoundedButtonStyle.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    
    var fixedWidth: CGFloat? = nil
    var fixedHeight: CGFloat? = nil
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: fixedWidth, height: fixedHeight)
            .padding(.horizontal, fixedWidth != nil ? 10 : 20)
            .padding(.vertical)
            .background(
                Color.mainBlue.opacity(
                    configuration.isPressed ? 0.5 : 1.0
                )
            )
            .foregroundColor(.white)
            .font(Font.system16Bold)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(
                .easeOut(duration: 0.2),
                value: configuration.isPressed
            )
    }
}


#Preview {
    
    VStack {
        Button("Hello") {
            
        }.buttonStyle(RoundedButtonStyle())
        
        Button("Hello") {
            
        }.buttonStyle(RoundedButtonStyle(fixedWidth: 300))
        
        Button("Hello") {
            
        }.buttonStyle(RoundedButtonStyle(fixedHeight: 100))
        
        Button("Very very Long Text Button") {
            
        }.buttonStyle(RoundedButtonStyle())
    }
}
