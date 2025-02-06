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
            Text("Welcome to Mindshift!")
                .font(.largeTitle)
                .padding(.vertical, 30)
            
            //Placeholder for the logo
            Image(systemName: "app.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.vertical, 30)
                .foregroundColor(.secondary)
            
            Button("Start") {
                coordinator.pushNext(to: .welcome)
            }
            .buttonStyle(RoundedButtonStyle(fixedWidth: 100))
            .padding(.vertical, 30)
        }
        .padding()
    }
}

#Preview {
    WelcomeView()
}
