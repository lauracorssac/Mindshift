//
//  ScenarioView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 06.03.25.
//

//
//  ScenarioView.swift
//  IDP-lets-go
//
//  Created by Alara Özdenler on 06.03.25.
//
import SwiftUI

struct ScenarioView: View {
    @State private var currentIndex = 0
    @State private var selectedMost: Int? = nil
    @State private var selectedLeast: Int? = nil
    
    @EnvironmentObject private var coordinator: AppCoordinator
    let scenarios = Scenarios()
    
    var body: some View {
        if currentIndex < scenarios.scenarios.count {
            VStack {
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
                                ResponseRow(
                                    text: scenarios.responses[currentIndex][index],
                                    index: index,
                                    selectedMost: $selectedMost,
                                    selectedLeast: $selectedLeast
                                )
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Question \(currentIndex + 1)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Next") {
                        if selectedMost != nil && selectedLeast != nil && currentIndex < scenarios.scenarios.count - 1  {
                            selectedMost = nil
                            selectedLeast = nil
                            currentIndex += 1
                        } else {
                            coordinator.pushNext(to: .questions)
                        }
                    }
                    .buttonStyle(RoundedButtonStyle(fixedWidth: 150, fixedHeight: 20))
                    .disabled(selectedMost == nil || selectedLeast == nil)
                }
            }
        }
    }
    
    struct ResponseRow: View {
        let text: String
        let index: Int
        @Binding var selectedMost: Int?
        @Binding var selectedLeast: Int?
        
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
                            if selectedLeast == index {
                                selectedLeast = nil
                            }
                            selectedMost = index
                        }
                        .buttonStyle(SelectableButtonStyle(isSelected: selectedMost == index))
                        Button("Least") {
                            if selectedMost == index {
                                selectedMost = nil
                            }
                            selectedLeast = index
                        }
                        .buttonStyle(SelectableButtonStyle(isSelected: selectedLeast == index))
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
}

struct SelectableButtonStyle: ButtonStyle {
    let isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 50, height: 30)
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(isSelected ? Color.mainBlue : Color.gray.opacity(0.5), lineWidth: 2)
            )
            .foregroundColor(.primary)
    }
}
    

#Preview {
    ScenarioView()
}
