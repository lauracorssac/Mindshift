//
//  ScenariosStartView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 05.03.25.
//

import SwiftUI

struct ScenariosStartView: View {
    
    var body: some View {
        VStack{
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
                .padding(.bottom, 20)
            
            Button("Continue") {
                //TODO: Navigation
            }
            .buttonStyle(RoundedButtonStyle())
            .padding()
        }
    }
}

#Preview {
    ScenariosStartView()
}
