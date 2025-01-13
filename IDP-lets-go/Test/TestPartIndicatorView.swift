//
//  TestPartIndicatorView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//
import SwiftUI
struct TestPartIndicatorView: View {
    let part: Int
    
    private func categoriesForPart(_ part: Int) -> (String, String) {
            switch part {
            case 1:
                return (TestFields.partOneCategories[0], TestFields.partOneCategories[1])
            case 2:
                return (TestFields.partTwoCategories[0], TestFields.partTwoCategories[1])
            case 3:
                return (TestFields.partThreeCategories[0], TestFields.partThreeCategories[1])
            case 4:
                return (TestFields.partFourCategories[0], TestFields.partFourCategories[1])
            case 5:
                return (TestFields.partFiveCategories[0], TestFields.partFiveCategories[1])
            case 6:
                return (TestFields.partSixCategories[0], TestFields.partSixCategories[1])
            case 7:
                return (TestFields.partSevenCategories[0], TestFields.partSevenCategories[1])
            default:
                return ("", "") // Fallback for out-of-range parts
            }
        }
        
    
    var body: some View {
        let (category1, category2) = categoriesForPart(part)
        
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
    TestPartIndicatorView(part:1)
        .environmentObject(AppCoordinator())
}

