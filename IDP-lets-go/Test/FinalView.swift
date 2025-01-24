//
//  FinalView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 29.12.24.
//

import SwiftUI
struct FinalView: View {

    var body: some View {
        VStack {
            Text("Thank You for Your Participation!")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            Image(systemName: "party.popper.fill")
                .font(.system(size: 100))
                .foregroundColor(Color.mainBlue)
                .padding(.vertical, 50)
            
            Text("You’ve successfully completed both tests!")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.bottom, 5)
            
            Text("Your responses are valuable in helping reduce bias.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.bottom, 30)

        }
        .padding(.horizontal)
    }
}

#Preview {
    FinalView()
}
