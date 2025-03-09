//
//  ScenarioView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 06.03.25.
//


import SwiftUI

struct ScenarioView: View {
    @State private var currentIndex = 0
    let scenarios = Scenarios()
    
    var body: some View {
        if currentIndex < scenarios.scenarios.count {
            VStack {
                Text("Question \(currentIndex + 1)")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .padding(.horizontal, 25)
                    .padding(.top, 30)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(scenarios.scenarios[currentIndex])
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.mainBlue, lineWidth: 3)
                        )
                        .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(0..<scenarios.responses[currentIndex].count, id: \.self) { index in
                                ResponseRow(text: scenarios.responses[currentIndex][index])
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button("Next Question") {
                    if currentIndex < scenarios.scenarios.count - 1 {
                        currentIndex += 1
                    }
                }
                .buttonStyle(RoundedButtonStyle(fixedWidth: 150, fixedHeight: 20))
                .padding(.bottom, 20)
            }
        } else {
            //TODO: Navigate to FinalView
        }
    }
}

struct ResponseRow: View {
    let text: String
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(Color.mainBlue)
                .frame(width: 8)
                .padding(.leading, 6)
            
            HStack {
                Text(text)
                    .font(.body)
                    .padding(.trailing, 5)
                
                Spacer()
                
                VStack {
                    Button("Most") {
                        //TODO: save the response
                    }
                        .buttonStyle(RoundedButtonStyle(fixedWidth: 45, fixedHeight: 1))
                    
                    Button("Least") {
                        //TODO: save the response
                    }
                        .buttonStyle(RoundedButtonStyle(fixedWidth: 45, fixedHeight: 1))
                }
            }
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.mainBlue, lineWidth: 3)
        )
        .padding(.horizontal)
    }
}

#Preview {
    ScenarioView()
}
