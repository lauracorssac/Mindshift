//
//  TestInformationView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

import SwiftUI

struct TestInformationView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Spacer()
            Text("In this study you will complete an Implicit Association Test (IAT) in which you will be asked to sort words into groups as fast as you can. In addition to the IAT, there are some questions about your beliefs, attitudes, and opinions, and some standard demographic questions. This study should take about 10 minutes to complete.")
                .multilineTextAlignment(.center)
                .padding()
            Button("Continue") {
                
                coordinator.pushNext(to: .testStart)
            }.buttonStyle(RoundedButtonStyle())
                .padding()
            Spacer()
            
            GuidanceBar(highlightedIndex: coordinator.isFirstTest ? 0: 2)
        }
        .padding(10)
    }
}
#Preview {
    TestInformationView()
        .environmentObject(AppCoordinator())
}
