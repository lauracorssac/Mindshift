import SwiftUI
struct TestPartIndicatorView: View {
    let part: Int
    let category1: String
    let category2: String
    //let onContinue: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Part \(part)/7")
                            .font(.headline)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
          
            Text("""
                Click left button for \(category1). Click right button for \(category2). Items will appear one at a time. If you make a mistake, click the right answer to continue. Go fast as you can while being accurate.
                """)
                .multilineTextAlignment(.center)
                           .font(.subheadline)
                           .foregroundColor(.gray)
                           .padding(.horizontal)
        
            Button("Continue") {
            }.buttonStyle(RoundedButtonStyle())
           
        }.padding()
    }
}

#Preview {
    TestPartIndicatorView(part:1, category1: "Family", category2: "Career")
        .environmentObject(AppCoordinator())
}
//
//  TestPartIndicatorView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

