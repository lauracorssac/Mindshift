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
    var isDisabled: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .multilineTextAlignment(.center)
            .frame(width: fixedWidth ?? 150, height: fixedHeight ?? 40)
            .padding(.vertical)
            .background(
                isDisabled ?
                Color.black.opacity(0.2) :
                Color.mainBlue.opacity(
                    configuration.isPressed ? 0.5 : 1.0
                )
                
            )
            .foregroundColor(.white)
            .font(Font.system18Bold)
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
        Button("Hello\nHello") {
            
        }.buttonStyle(RoundedButtonStyle(fixedHeight: 50))
        
        Button("Hello") {
            
        }
        .buttonStyle(RoundedButtonStyle(fixedWidth: 150))
        
        
        Button("Hello") {
            
        }.buttonStyle(RoundedButtonStyle(fixedHeight: 100))
        
    }
}
