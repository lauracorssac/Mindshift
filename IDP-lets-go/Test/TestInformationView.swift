//
//  TestInformationView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

import SwiftUI

struct TestInformationView: View {

    var body: some View {
        VStack {
            Text("In this study you will complete an Implicit Association Test (IAT) in which you will be asked to sort words into groups as fast as you can. In addition to the IAT, there are some questions about your beliefs, attitudes, and opinions, and some standard demographic questions. This study should take about 10 minutes to complete.")
                .multilineTextAlignment(.center)
                .padding()
            Button("Continue") {
            }.buttonStyle(RoundedButtonStyle())
                .padding()
        }
        .padding(10)
    }
}
#Preview {
    TestInformationView()
        .environmentObject(AppCoordinator())
}
