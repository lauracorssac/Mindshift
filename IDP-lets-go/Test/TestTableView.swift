//
//  TestTableView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

import SwiftUI


struct TestTableView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    let testTableFields = [
           ("Category", "Items"),
           ("Male", "Ben, Paul, Daniel, John, Jeffrey "),
           ("Female", "Rebecca, Michelle, Emily, Julia, Anna"),
           ("Family", "Wedding, Marriage, Parents, Relatives, Family, Home, Children"),
           ("Career", "Career, Corporation, Business, Office, Professional, Management, Salary")
       ]
    
    var body: some View {
        VStack {
            Text("You will use left and right buttons to categorize item.")
                .multilineTextAlignment(.center)
                .padding()
            VStack{
                ForEach(testTableFields, id: \.0) { category, items in
                    HStack {
                        Text(category)
                            .fontWeight(category == "Category" ? .bold : .regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 1)
                        
                        Divider()
                        
                        Text(items)
                            .fontWeight(category == "Category" ? .bold : .regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 1)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
        
            Text("There are seven parts. The instructions will change for each part. Pay attention!")
                .multilineTextAlignment(.center)
                .padding()
                .bold()
            Button("Continue") {
               
                coordinator.pushNext(to: .testTableView)
                
            }.buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }
}
#Preview {
    TestTableView()
        .environmentObject(AppCoordinator())
}
