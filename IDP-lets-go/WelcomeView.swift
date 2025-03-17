//
//  WelcomeView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 20.01.25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        
       
            VStack {
                Text("Welcome to")
                    .font(.title)
                    .padding(.top, 30)
                    .padding(.bottom, 1)
                
                Text("Mindshift")
                    .font(.system(size: 56).bold())
                    
                
                Image("filled-cloud")
                
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.vertical, 30)
                    .foregroundColor(.secondary)
                
                Button("Start") {
                    coordinator.pushNext(to: .welcome)
                }
                .buttonStyle(RoundedButtonStyle())
                .padding(.vertical, 30)
            }
            .gradientBackground()
            
        
    }
}

#Preview {
    WelcomeView()
}
