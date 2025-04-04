//
//  ScenariosStartView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 05.03.25.
//

import SwiftUI

struct ScenariosStartView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("For the following 10 questions, please read each scenario carefully and choose two responses:")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.bottom, 10)
            
            Text("1) the response that most likely reflects what you would do and")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.bottom, 10)
            
            Text("2) the response that least likely reflects what you would do.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.bottom, 20)
            
            Text("Some questions may involve descriptions of situations you normally face, and some may not. Sometimes you might think of another strategy you might use. That is okay. Please choose from the responses presented.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.bottom)
            
            Button("Continue") {
                coordinator.pushNext(to: .questionsStart)
            }
            .buttonStyle(RoundedButtonStyle())
            .padding()
            
            Spacer()
            
            GuidanceBar(
                highlightedIndex: 2,
                group: coordinator.group
            )
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    NavigationStack {
        ScenariosStartView()
            .environmentObject(AppCoordinator())
    }
}
